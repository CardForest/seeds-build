CardForest-Seeds - website
==========================

The source for the [CardForest-Seeds](https://github.com/CardForest/seeds) website.

Getting Started
---------------

### Clone the repository

Clone the seeds-website repository using [git](http://git-scm.com/). Make sure you use the ```--recursive``` flag in order to get it with the required submodule:

```
git clone --recursive git://github.com/CardForest/seeds-website.git
cd seeds-website
```

**Note:** If already cloned the repository without the ```--recursive``` flag then you can still download the submodule by running the following command from the project folder:

```
git submodule update --init --recursive
```

### Install Dependencies

We build our website using [node](http://nodejs.org) and get the tools we depend upon via `npm`, the [node package manager](https://www.npmjs.org/) (included with node).

```
npm install
```
