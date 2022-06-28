---
title: Data transport in OMERO
author: Guillaume Gay, France BioImaging
fontsize: 8pt
width: 1024
height: 780
margin: 0.01
center: true
disableLayout: false
---


## The data life cycle

![](images/data_cycle.svg)


<div class="r-fit-text"> 1. Acquire → 2. Import → 3. Analyze → 4. Publish → 5. Archive </div>


## How do you do transport the data ?

### Constrains:

a. User friendliness
b. Microscope should be free ASAP after acquisition
c. Omero should not crash due to heavy import load
d. Admin friendliness:
  - Good error reporting
  - Good integrity testing


## transport and import combined

### omero-insight


:::::::::::::: {.columns}
::: {.column width="50%"}
- :thumbsup: Familiar
- :thumbsup: Robust
:::
::: {.column width="50%"}
- :thumbsdown: Tied to user session
- :thumbsdown: User does admin's work
- :thumbsdown: Might crash the server
- :thumbsdown: Maintenance mode
:::
::::::::::::::


### omero-ms-queue

> plugin to omero-insight to have an asynchronous import server

:::::::::::::: {.columns}
::: {.column width="50%"}
- :thumbsup: Familiar
- :thumbsup: Robust
- :thumbsup: Asynchronous
- :thumbsup: Good design
:::
::: {.column width="50%"}
- :thumbsdown: No maintainer
- :thumbsdown: insight in maintenance
:::
::::::::::::::


## transport then import


### transport on a network drive

#### [auto-tx](https://github.com/imcf/auto-tx)

:::::::::::::: {.columns}
::: {.column width="50%"}
- :thumbsup: Robust
- :thumbsup: Asynchronous
- :thumbsup: Good design
:::
::: {.column width="50%"}
- :thumbsdown: Needs an AD login
:::
::::::::::::::

----


#### Robocopy

> Anyone has experience with that?


------


#### Pure CIFS / network drive

:::::::::::::: {.columns}
::: {.column width="50%"}
- :thumbsup: Familiar
- :thumbsup: Robust ?
- :thumbsup: Asynchronous ?
- :thumbsup: Good design ?
:::
::: {.column width="50%"}
- :thumbsdown: Error reporting ?
- :thumbsdown: Performance ?
:::
::::::::::::::

-----


#### SeaFile / Nextcloud

:::::::::::::: {.columns}
::: {.column width="50%"}
- :thumbsup: Familiar
- :thumbsup: Robust
- :thumbsup: Good design
- :thumbsup: Drive outside of LAN
:::
::: {.column width="50%"}
- :thumbsdown: Error reporting ?
- :thumbsdown: Performance ?
- :thumbsdown: tied to session
:::
::::::::::::::

------------


#### Daemon (e.g an `rsync` script)

:::::::::::::: {.columns}
::: {.column width="50%"}
- :thumbsup: Asynchronous
- :thumbsup: Drive outside of LAN
:::
::: {.column width="50%"}
- :thumbsdown: Bash script
- :thumbsdown: Error reporting ?
- :thumbsdown: Performance ?
:::
::::::::::::::

---------


### import

#### omero-cli / python script

:::::::::::::: {.columns}
::: {.column width="50%"}
- :thumbsup: User transparent
- :thumbsup: Asynchronous
- :thumbsup: Robust
:::
::: {.column width="50%"}
- :thumbsdown: Site specific
- :thumbsdown: Everybody has its own
- :thumbsdown: How to filter data?
:::
::::::::::::::


---------


#### Desktop client

[Omero inplace importer](https://github.com/alex-rapp/omeroinplaceimporter)


:::::::::::::: {.columns}
::: {.column width="50%"}
- :thumbsup: User friendly
- :thumbsup: Asynchronous (?)
- :thumbsup: User input
:::
::: {.column width="50%"}
- :thumbsdown: Maintenance?
:::
::::::::::::::


---------

#### web client

> Do you know any?
