# DBAToolbox

<p>
    <img src="https://img.shields.io/badge/version-1.2-orange.svg" alt="">
    <a href="LICENSE.md"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt=""></a>
    <img src="https://img.shields.io/badge/toolbox-MS SQL-green.svg" alt=""> 
</p>

A Microsoft SQL Server database specific toolbox collection with lots of potential.

## Getting Started

- Download the package
- Fast lane: 
    1. Restore provided backup file and you are (almost) ready to roll. I have provided the backup file for MSSQL 2014 and 2016. If you are still using MSSQL 2012, probably the restore will not work so you need to switch to the slow lane path.
- Slow lane: 
    1. Review each of the sql source files.
    2. Read the header comments for each script.
    3. Do some minor adaptions, if you prefer. 
    4. Open up a new query and execute each file in sequential order.
        - 01_Body.sql
        - 02_Skeleton.sql
        - 03_Brain.sql
        - 04_Gene.sql
    5. Now you are (almost) ready to roll.

### Prerequisites

You need to have 
- Microsoft SQL Server installed (no matter which version).
- Some space for the DB file, not much though.
- Decide where to save the DB file.

### Installing

- Fast lane: 
    1. Restore provided backup file and you are (almost) ready to roll
        i) To get the most out of the toolbox, you need to define some SQL linked servers. This is, of course, only required in case you are planning to run the queries against remote servers.
        ii) If you prefer to keep data collection and the logic part separated, then I suggest you to drop all tables with schema [dtx] and recreate them in a separate database. To do that choose the method you are familiar with. You can also extract the required parts from the 02_Skeleton.sql script. 
        iii) For a more detailed information about how data collection can be done, refer to the the user manual.
- Slow lane: 
    1. Review each of the sql source files.
    2. Read the header docx for each script.
    3. Do some minor adaptions, if you prefer. 
    4. Open up a new query and execute each file in sequential order.
        - 01_Body.sql
        - 02_Skeleton.sql
        - 03_Brain.sql
        - 04_Gene.sql
    5. Now you are (almost) ready to roll.

## (Almost) ready to roll ?!

Well, after installation everything is going to work as expected / intended on your LOCAL server. The (almost) part is only referring to the situation in which you want to execute the stored procedures against REMOTE servers. To be able to do that,
- first you need to create and configure some SQL Linked Servers. 
- Then sort out any permission related issues regarding the Linked Server connectivity. 
- You may also need to do some MSDTC related troubleshooting to get things working properly, as MSDTC, which is playing a central role when Linked Servers are on the menu, is not a nice and easy fellow. MSDTC needs to be configured on the remote server, service must run and also accept connections. This all may end up sometimes in really ugly situations which will give you really hard times.

If you prefer not to go the Linked Server way for any reason you can backup your new shiny DBAToolbox and restore it on the remote server. This of course wasn't my initial intention when I came up with the idea of making the DBAToolbox, but if you like it this way or if it is not working the other way, then be my guest.

My main intention was to find a method of doing (almost) all of the Analysis / Data Collection etc. centrally from one DB server to keep everything in one place and also not change anything on remote servers. As I have probably mentioned in other places, there might be some similar solution out there doing the same thing, I just didn't find one which suits me or which I liked, every one I tested did have some weak points, so I made one of my own. 

DBAToolbox, for sure, may have some weak points, too, but so far the ones I discovered were some limitations caused by the SQL Server itself (or probably my lack of knowledge on how things could be done better). But hey, this is not the final version. I am getting better every day.

## Running the tests

The easy way to know what the DBAToolbox can do for you is to get your hands into the mud and play with the stored procedures. None of the stored procedures, as far as I can say, does anything harmful, as most of them are only data fetchers (collectors) and you can safely execute them against your own db server. As for other people's databases or production servers, please be aware: 

Using these tools against production db servers REQUIRES you to understand what each one of these tools does in the first place to be aware of the consequences. This is to avoid putting productive servers under unneccessary load / pressure.

And anyway, production environment is NOT there for you to play or experiment with. 

Learn each tool and its usage and outcome, and when you know what it does, start to use each one for your daily tasks. I have tried my best to provide as much as possible documentation and helpful comments and so on. Check the Help for each SP, read the important remarks. Review the authors' comments. Open the SP for modification and look at the code. Review the messages which get printed out.

Before any contributions, it's recommended to run tests using:
```
docker-compose run tests
```
This will apply the SQL to a docker-contained MSSQL and thus check for any syntax errors.

### Break down into end to end tests

There are many tools in the collection. In the beginning you may get a bit surprised and do not know which tool is good for what purpose. 
- Take your time. 
- Have a Kitkat. 
- Review the help for each tool.
- Review the important remarks section (if any).
- Check the source code for each SP.
- Visit the authors' sites.
- Read and review references provided (if any).
- Execute the SP against your local server to see the outcome and start to analyse the result.
- Have fun

## Deployment

There is not much to explain. You could either restore the provided DB or install it using the provided scripts as explained above. If one day you add up your own (secret :D) tools to the DBAToolbox, then I suggest you to follow the path I went to document and script your code and so on.

## Built With

* Lots of tick tock on the clock
* Hard work and buckets of sweat

## Contributing

I have to come up with some proper [CONTRIBUTING.md] first. Until then you could fork the project if you wish, do the changes and submit a pull requests. Or just change, add files and submit a pull request.

I WILL NOT ACCEPT ANY FULL BACKUP DBs TO RESTORE SO DON'T WASTE YOUR TIME (AND ALSO MINE ;D). 

Provided DB Backups is a one way path which is ---> From Me ---> To everyone who just wants to get things rolling as fast as they can and don't have time or interest building up the solution from scratch.  

## Authors

* DBAToolbox and some of the core queries: Me, EsQueEl-Fella (The dude whose real name is known as Alex Wernhardt).
* Most of the core queries: Great DBA Experts / Authors / Specialists around the globe. Each script contains the copyrights of each author (if I found one in their code) and accordingly credits, references and so on. You can review each by looking at the source code for each tool/sp.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details. Some of the core queries may not be released under MIT license but other license types. This is mentioned in the source code for each tool.

Some of the tools may require you to download the tool directly from the authors' sites. This is because authors wanted it this way (Like Adam Machanic's WhoIsAcrive). 

Thre are also some tools which I only ADD to the collection, but they may require you to get the latest version from the authors' sites before usage (Like Brent Ozar's First Responder Kit or Ola Hallengren's maintenance scripts)

## Acknowledgments

* Thanks to ALL Great DB Experts, Authors / Specialists around the globe

