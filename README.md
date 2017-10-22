# Welcome to pa-redist-runner

> There are strange things done in the midnight sun
>
> By the men who moil for gold;
>
> The Arctic trails have their secret tales
>
> That would make your blood run cold;
>
> -- Robert W. Service (The Cremation of Sam McGee)


The purpose of this repo is to have the data and code necessary to test different redistricting plans for the Stat of Pennsylvania. Of course 

License: You may not use this code for partisan political purposes. Other than that, [Creative Commons Attribution 4.0 Applies](https://creativecommons.org/licenses/by/4.0/)



### Install on Mac

* Install R
* Install geo library dependancies

   ```
   brew update
   brew install gdal # for rgdal
   ```
* Launch your favorite R IDE _cough RStudio cough_
* Run `packrat::init()`
* Enjoy!