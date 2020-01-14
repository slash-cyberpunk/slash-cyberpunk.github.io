---
layout: post
title: Python virtualenv и spark-submit
---

Сегодня решал одну проблему, когда zip архив с python virtualenv раскидывался через spark-submit на кластер hadoop и при этом python не запускался и падал с ошибкой:  
<code>symbol lookup error: ./bin/python3.6: undefined symbol: _Py_LegacyLocaleDetected</code>

-----



-----

Вывод: не стоит пользоваться zip...
