---
layout: post
title: Vertica agent and systemd
---

В предыдущем посте я писал, что использую Vertica для DWH и пытался решить проблему с доступом к VIEW, а для этого один из способов был установить свежие патчи на наш UAT кластер.

-----

Мы используем Cent OS 7, а если кто не знает, то rpm vertica собирается для RHEL6, в котором vertica_agent работает по аналогии init.d сервиса и соответственно этот сервис, после установки, транслируется в systemd сервис. Вся установка автоматизирована ansible, а в самом rpm уже все handlers присутствуют для управлением сервиса после установки, поэтому на стороне ansible мы это не контролируем.  
И вот решив обновить кластер я заметил, что пост-скрипт обработки не завершается успешно и как выяснилось, проблема в том, что vertica_agent.service не видит процесс и теряет PID с ошибкой <code>systemd[1]: New main PID < pid > does not belong to service, and PID file is not owned by root. Refusing.</code>.  
Проверив прод и убедившись, что там все корректно работает я сравнил версии systemd и получилось, что все работает на версии systemd-219-62.el7.x86_64, но на версии systemd-219-67.el7.x86_64 проявляется ошибка. Сама ошибка в целом решаема, но не быстрым путем, т.к. в скрипте запуска vertica_agent сложная логика управлением PID и его правами...

-----

Решение пока не выбрал, запрос в саппорт написал, ждем-с...