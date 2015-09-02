# wordpress #

[![Puppet Forge](https://img.shields.io/badge/puppetforge-v0.1.0-blue.svg)](https://forge.puppetlabs.com/swizzley88/wordpress)

**Table of Contents**

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
4. [Usage](#usage)
5. [Requirements](#requirements)
6. [Compatibility](#compatibility)
7. [Limitations](#limitations)
8. [Development](#development)
    * [TODO](#todo)
    
## Overview ##

This module sets up the L.A.M.P server Wordpress for blogging and such.  

## Module Description ##

This module is designed to be a simple and minimalistic... a one and done setup for wordpress on EL systems. 

## Setup ##

Modify or inherit parameters in params.pp to your liking. Enable php repo in true by default. 

## Usage ##

```
include ::wordpress
```

## Requirements ##

puppetlabs/mysql

puppetlabs/apache

## Compatibility ##

  * RHEL 6
  * CentOS 6

## Limitations ##

This module has been tested on:

  - CentOS 6

## Development ##

Any updates or contibutions are welcome.

Report any issues with current release, as any input will be considered valuable.


#### TODO ####

  * add other OS support
 
###### Contact ######

Email:  morgan@aspendenver.org

WWW:    www.aspendenver.org

Github: https://github.com/swizzley
