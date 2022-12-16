# wobblynameR

wobblynameR is my first R package and it is still a work in progress. 
I wrote it to more easily edit several columnnames in a dataframe in a similar manner. 
This is important for many scientific usage cases in data management. The code is rather simple, but thus far I did not find available functions
that take care of the same process.

*wobblynameR currently only contains one function, namepref(), but will be extended shortly.*

All functions use either  **pref** as an **abbreviation for prefix** or **suff for suffix**. Somewhat analogously to paste() and paste0(), with
namepref0() you will be able to only add a prefix while namepref() allows you to define an old prefix that will be removed and replaced with 
the new one. THe same is true for namesuff() and namesuff0().

The first use case of these was for the [SPeADy project](http://www.speady.de/studies/?lang=en).

Hope you enjoy! :)

Anni Tave
