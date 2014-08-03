# procfs

[![Build status](https://secure.travis-ci.org/pmuller/procfs.png?branch=master)](http://travis-ci.org/pmuller/procfs)
[![Downloads](https://pypip.in/download/procfs/badge.png)](https://pypi.python.org/pypi//procfs/)
[![Latest Version](https://pypip.in/version/procfs/badge.png)](https://pypi.python.org/pypi/procfs/)
[![License](https://pypip.in/license/procfs/badge.png)](https://pypi.python.org/pypi/procfs/)

## Python Library

### Install

	$ pip install procfs

### Usage

#### Basic usage

	>>> from procfs import Proc
	>>> proc = Proc()

	>>> proc.loadavg
	{'average': {1: 0.0, 5: 0.0, 15: 0.0},
	 'entities': {'current': 1, 'total': 117},
	 'last_pid': 3068}

	>>> proc.net.dev.eth1.receive.bytes
	117997558

	>>> proc.meminfo.MemFree
	57044

	>>> proc.net.snmp.Udp
	{'InDatagrams': 3394, 'OutDatagrams': 3399, 'RcvbufErrors': 0,
	 'InErrors': 0, 'SndbufErrors': 0, 'NoPorts': 4}

#### Process information

	>>> proc.self
	<Process 3068: python>

	>>> proc.self.parent
	<Process 17423: bash>

	>>> proc.self.uptime
	datetime.timedelta(0, 346, 380262)

	>>> proc.processes
	<Processes: [<Process 1: init>, <Process 2: kthreadd>, <Process 3: migration/0>, <Process 4: ksoftirqd/0>, <Process 5: watchdog/0>, <Process 6: migration/1>, <Process 7: ksoftirqd/1>, <Process 8: watchdog/1>, <Process 9: events/0>, <Process 10: events/1>, ...]>
	>>> len(proc.processes)
	110

	>>> proc.processes.cmdline('(vim|ssh)')
	<Processes: [<Process 2956: vim>, <Process 3044: vim>, <Process 3136: vim>, <Process 10422: sshd>, <Process 10440: sshd>, <Process 10504: sshd>]>

	>>> proc.processes.uid(1000) 
	<Processes: [<Process 1120: bash>, <Process 2593: bash>, <Process 2956: vim>, <Process 3044: vim>, <Process 3093: python>, <Process 10504: sshd>, <Process 10505: bash>, <Process 10875: screen>, <Process 10876: screen>, <Process 12908: bash>, ...]>

	>>> proc.processes.user('pmuller').cmdline('python')[0]
	<Process 3093: python>

## Docker Container Appliance

You can also use the built-in CLI and HTTP server to get JSON results from a Docker container. Both support JSON Pointer style querying into the data structures.

### Using the CLI with Docker

	$ docker run procfs loadavg
	{"entities": {"current": 1, "total": 132}, "average": {"1": 0.0, "5": 0.01, "15": 0.07}, "last_pid": 9}
	$ docker run procfs loadavg/average
	{"1": 0.0, "5": 0.01, "15": 0.07}
	$ docker run procfs loadavg/average/1
	0.0

### Using the HTTP server with Docker

	$ docker run -d -p 8000:8000 procfs
	$ curl localhost:8000/loadavg
	{"entities": {"current": 1, "total": 132}, "average": {"1": 0.0, "5": 0.01, "15": 0.07}, "last_pid": 9}
	$ curl localhost:8000/loadavg/average
	{"1": 0.0, "5": 0.01, "15": 0.07}
	$ curl localhost:8000/loadavg/average/1
	0.0


## Links

 * [documentation](http://packages.python.org/procfs/)
 * [github](http://github.com/pmuller/procfs)

[![Bitdeli badge](https://d2weczhvl823v0.cloudfront.net/pmuller/procfs/trend.png)](https://bitdeli.com/free)
