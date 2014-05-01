CardForest-Seeds - build setup
==========================

This code builds the [seeds website](http://seeds.cardforest.com/) from its [sources](https://github.com/CardForest/seeds).

Getting Started
---------------

### Clone the repository

Clone the seeds-website repository using [git](http://git-scm.com/). Make sure you use the ```--recursive``` flag in order to get it with the required submodule:

1. Install [git](http://git-scm.com/) (if you haven't already)
2. Clone the repository:

```shell
git clone --recursive git://github.com/CardForest/seeds-website.git
cd seeds-website
```

**Note:** If already cloned the repository without the ```--recursive``` flag then you can still download the submodule by running the following command from the project folder:

```shell
git submodule update --init --recursive
```

### Install Dependencies

We build our website using the [gulp](http://gulpjs.com/) build system, which runs on the [node](http://nodejs.org) runtime, We get the tools we depend upon via `npm`, the [node package manager](https://www.npmjs.org/) (included with node).

1. Install [node](http://nodejs.org) (if you haven't already)
2. Install [gulp](http://gulpjs.com/) (if you haven't already):
    
        npm install gulp -g
3. Install our build-specific dependencies:

        npm install

### Run Locally 

Execute ```gulp live``` to start the local server on ```http://localhost:9000```. The server will automatically reload browsers when the sources change. Add `-p` to run the server in _production_ mode.

### Contributing

After testing that everything is OK locally you can contribute you changes. If it's just a small change in a single file than you can edit the file using github GUI. If it's a bigger change you should [fork](https://help.github.com/articles/fork-a-repo) this repository, make the changes on your repository and send a [pull request](https://help.github.com/articles/using-pull-requests). 
> (...and if all that fails you can just ask for help or send the files by e-mail)


