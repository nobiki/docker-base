# selenium-base

## Overview

Run `make` to see help

```
network                        [Up] Selenium Network - ${COMPOSE_PROJECT_NAME}-net
network-cleanup                [Down] Selenium Network
hub                            [Up] Selenium Grid Hub - localhost:4444
hub-cleanup                    [Down] Selenium Grid Hub
node-chrome                    [Up] Node Chrome Browser
node-firefox                   [Up] Node Firefox Browser
node-allbrowsers               [Up] All Node Browsers
node-cleanup                   [Down] All Node
node-build                     [Build] All Node
test                           [Up] Standard Testing
iplist                         show container ip
```


## Usage

1. Craete Selenium Network

```bash
make network
```

2. Create Selenium Hub

```bash
make hub
```

3. Launch any browser and connect to the Grid

```bash
make node-chrome
```

4. Visit http://localhost:4444 to check if the node is registered correctly.