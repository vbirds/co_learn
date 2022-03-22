/*
* Tencent is pleased to support the open source community by making Libco available.

* Copyright (C) 2014 THL A29 Limited, a Tencent company. All rights reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License"); 
* you may not use this file except in compliance with the License. 
* You may obtain a copy of the License at
*
*	http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, 
* software distributed under the License is distributed on an "AS IS" BASIS, 
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
* See the License for the specific language governing permissions and 
* limitations under the License.
*/

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <queue>
#include "co_routine.h"
using namespace std;
struct stTask_t
{
	int id;
};
struct stEnv_t
{
	stCoCond_t* cond;
	queue<stTask_t*> task_queue;
};

struct stConsumeEnv_t
{
    stEnv_t * env;
    int consume_id;
};

void* Producer(void* args)
{
	co_enable_hook_sys();
	stEnv_t* env=  (stEnv_t*)args;
	int id = 0;
	while (true)
	{
		stTask_t* task = (stTask_t*)calloc(1, sizeof(stTask_t));
		task->id = id++;
		env->task_queue.push(task);
		printf("%s:%d produce task %d\n", __func__, __LINE__, task->id);
		co_cond_signal(env->cond);
        co_yield_ct_timeout(1000);
	}
	return NULL;
}

void* Consumer(void* args)
{
	co_enable_hook_sys();
    stConsumeEnv_t* env = (stConsumeEnv_t*)args;
	while (true)
	{
		if (env->env->task_queue.empty())
		{
            printf("consume id %d yield \n", env->consume_id);
			co_cond_timedwait(env->env->cond, -1);
			continue;
		}
		stTask_t* task = env->env->task_queue.front();
		env->env->task_queue.pop();
		printf("consume id %d consume task %d\n", env->consume_id, task->id);
		free(task);
	}
	return NULL;
}

int main()
{
	stEnv_t* env = new stEnv_t;
	env->cond = co_cond_alloc();

    // 创建多个消费者
	stCoRoutine_t* consumer_routine_list[3] = {nullptr};
    for (int i = 0; i < 2; i++)
    {
        stConsumeEnv_t * st = new stConsumeEnv_t;
        st->env = env;
        st->consume_id = i +1;
        co_create(&consumer_routine_list[i], NULL, Consumer, st);
        co_resume(consumer_routine_list[i]);
    }

    // 创建消费者
	stCoRoutine_t* producer_routine;
	co_create(&producer_routine, NULL, Producer, env);
    // 立即执行
	co_resume(producer_routine);

    // 多个consumer 依次消费producer生产出的消息;
	co_eventloop(co_get_epoll_ct(), NULL, NULL);
	return 0;
}
