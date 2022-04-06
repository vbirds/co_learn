
#include <unistd.h>
#include <stdio.h>
#include "co_routine.h"

struct stRoutineArgs_t
{
    stCoRoutine_t* co;
    int routine_id;
};

void* loop(void* args)
{
    int task_id = *((int*)args);
    for (int i = 0; i < 3; i++)
    {
        printf("task id %d loop %d\n", task_id, i);
        // 让出协程
        co_yield_ct();
    }
    printf("end task id %d\n", task_id);
    return NULL;
}

int main()
{
    stRoutineArgs_t coRoutineArray[3];
    // 创建3个协程，每个协程里循环打印，每打印一次让出
    for (int i = 0; i < 3; i++)
    {
        coRoutineArray[i].routine_id = i+1;
        co_create(&coRoutineArray[i].co, NULL, loop, &coRoutineArray[i].routine_id);
    }

    // 简单的协程管理调度实现
#if 1
    while (true)
    {
        bool bAllEnd = true;
        for (int i = 0; i < (sizeof(coRoutineArray)/sizeof(coRoutineArray[0])); i++)
        {
            if (!co_end(coRoutineArray[i].co))
            {
                bAllEnd = false;
                co_resume(coRoutineArray[i].co);
            }
        }

        if (bAllEnd)
        {
            break;
        }
    }
    printf("all co routine end\n");

    for (int i = 0; i < (sizeof(coRoutineArray)/sizeof(coRoutineArray[0])); i++)
    {
        co_release(coRoutineArray[i].co);
    }
#endif

    return 0;
}
