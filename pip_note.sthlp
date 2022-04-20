{smcl}
{* *! version 1.0.0 20 sep 2019}{...}
{title:Description of the {cmd:server()} and {cmd:identity()} options}

{phang}
{opt server(string)} Three servers (PROD, QA, and DEC) are available to run pip stata commands. 
These options are {err:only available internally} for the World Bank's staff. The following are descriptions for each of these servers:

{p 8 8 2}{bf:1) PROD (Production)}: This server contains everything that is available outside the Bank’s intranet. 
Use {cmd:server(prod)} option to access pip data in the PROD server. 

{p 8 8 2}{bf:2) QA (Quality Assurance server)}: This server is available within the intranet to check new version of pip data before it is available outside the Bank’s intranet. 
This option can be provided in the pip stata command call as {cmd:server(qa)}. 

{p 8 8 2}{bf:3) DEV (Development)}: This serve is used for testing new PIP API features and improvements, and it is also available to work on it for special projects. 
This option can be provided in the pip stata command call as {cmd:server(dev)}.

{phang}
{opt identity(string)} PIP commands allows us to specify which version of the data we want to make a query on. 
To specify the version of PIP data, include optional parameter {cmd:identity()} in the pip command. 
Th {cmd:identity()} has three possible values (prod, int, and test). Here are descriptions of each of these values:

{p 8 8 2}{bf: PROD} : Refers to production. Only the folders with this suffix will be considered by the API as production folders that will be deploy in the main API and website. 
You Could find this kind of folder in the in any of the three servers explained above.

{p 8 8 2}{bf: INT} : Refers to folders that will be used internally by specific people for specific purposes. 
These folders won’t be ever sent to production. Also, these folders are static and should not be modified by the PIP technical team for any reason. 
If the contents of an INT folder are needed to be sent to production, the PROD folder has to be recreated and tested to guarantee full transparency in the process.  
These folders available only in the DEV server.

{p 8 8 2}{bf: TEST} : Refers to testing folders that could vary and be modified as needed by the PIP technical team, but they are still understood by the PIP API. 
These folders available only in the DEV server.

{title:Description of the Data Versioning components}

{phang}
{bf:Data Versioning} : One of the main features of the PIP is providing the user with the ability to use any vintage of the PIP data. 
The vintage control has the following form, {it: {bf: %Y%m%d_YYYY_RV_AV_SSS}}. Each component of the folder structure/ form separated by “_” described as follows: 

{p 8 8 2}{it:{bf: %Y%m%d}} : Refers to an 8-digit number that conforms, in general, to the release date of PIP. 
However, it does not necessarily refers to the release date of PIP. It could refer to any other date. 
What identifies a folder as an official release is the suffix SSS, which is explained below. 

{p 8 8 2}{it:{bf: YYYY}} : Refers to the PPP round (e.g., 2005, 2011, 2017). 

{p 8 8 2}{it:{bf: RV}} : Refers to the {ul:release version of the PPP round}. It is possible to have different release versions for the same round of PPP. 
This happens when there are major revisions implemented for the ICP team.  

{p 8 8 2}{it:{bf: AV}} : Refers to the {ul:adaptation version of the release version of the PPP round}. 

{p 8 8 2}{it:{bf:SSS}} : Refers to the {ul:identity} of the folder. See above {cmd:identity()} option for the description of the identity folder.

{title:Examples}

{phang}
Here are some examples that show the use of the {cmd:server()} and {cmd:identity()} optional commands in pip stata command calls:

{phang}
1) {stata pip versions, server(prod)} -> displays all the versions in PROD server.

{phang}
2) {stata pip, country(PRY) year(2012) server(dev) clear} -> {cmd:server()} option for countrycountry estimation in 2012 using the DEV server

{phang}
3) {stata pip, country(PRY) year(2012) server(dev) identity(INT) clear} -> {cmd:server()} option for country estimation in 2012 using the DEV server from INT data version.

{phang}
{help pip:Go back to pip help page}



