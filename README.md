CardForest-Seeds - website
==========================

The source for the [CardForest-Seeds](https://github.com/CardForest/seeds) website.

Getting Started
---------------

### Clone the repository

Clone the seeds-website repository using [git](http://git-scm.com/). Make sure you use the ```--recursive``` flag in order to get it with the required submodule:

1. Install [git](http://git-scm.com/) (if you haven't already)
2. Clone the repository:

        git clone --recursive git://github.com/CardForest/seeds-website.git
        cd seeds-website


**Note:** If already cloned the repository without the ```--recursive``` flag then you can still download the submodule by running the following command from the project folder:

```
git submodule update --init --recursive
```

### Install Dependencies

We build our website using the [gulp](http://gulpjs.com/) build system, which runs on the [node](http://nodejs.org) runtime, We get the tools we depend upon via `npm`, the [node package manager](https://www.npmjs.org/) (included with node).

1. Install [node](http://nodejs.org) (if you haven't already)
2. Install [gulp](http://gulpjs.com/) (if you haven't already):
    
        npm install gulp -g
3. Install our build-specific dependencies:

        npm install

