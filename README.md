
iNZight Development Repository
==============================

This repository is where we can store all of our development scripts, files, bug lists, etc.

<table style="width:56%;">
<colgroup>
<col width="5%" />
<col width="5%" />
<col width="5%" />
<col width="5%" />
<col width="5%" />
<col width="5%" />
<col width="5%" />
<col width="5%" />
<col width="5%" />
<col width="5%" />
</colgroup>
<thead>
<tr class="header">
<th align="right"></th>
<th align="left">iNZight</th>
<th align="left">iNZightPlots</th>
<th align="left">iNZightModules</th>
<th align="left">iNZightTS</th>
<th align="left">iNZightMR</th>
<th align="left">iNZightRegression</th>
<th align="left">iNZightMaps</th>
<th align="left">iNZightTools</th>
<th align="left">vit</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="right">master</td>
<td align="left"><a href="https://travis-ci.org/iNZightVIT/iNZight"><img src="https://travis-ci.org/iNZightVIT/iNZight.svg?branch=master" alt="Travis-CI Build Status" /></a></td>
<td align="left"><a href="https://travis-ci.org/iNZightVIT/iNZightPlots"><img src="https://travis-ci.org/iNZightVIT/iNZightPlots.svg?branch=master" alt="Travis-CI Build Status" /></a></td>
<td align="left"><a href="https://travis-ci.org/iNZightVIT/iNZightModules"><img src="https://travis-ci.org/iNZightVIT/iNZightModules.svg?branch=master" alt="Travis-CI Build Status" /></a></td>
<td align="left"><a href="https://travis-ci.org/iNZightVIT/iNZightTS"><img src="https://travis-ci.org/iNZightVIT/iNZightTS.svg?branch=master" alt="Travis-CI Build Status" /></a></td>
<td align="left"><a href="https://travis-ci.org/iNZightVIT/iNZightMR"><img src="https://travis-ci.org/iNZightVIT/iNZightMR.svg?branch=master" alt="Travis-CI Build Status" /></a></td>
<td align="left"><a href="https://travis-ci.org/iNZightVIT/iNZightRegression"><img src="https://travis-ci.org/iNZightVIT/iNZightRegression.svg?branch=master" alt="Travis-CI Build Status" /></a></td>
<td align="left"><a href="https://travis-ci.org/iNZightVIT/iNZightMaps"><img src="https://travis-ci.org/iNZightVIT/iNZightMaps.svg?branch=master" alt="Travis-CI Build Status" /></a></td>
<td align="left"><a href="https://travis-ci.org/iNZightVIT/iNZightTools"><img src="https://travis-ci.org/iNZightVIT/iNZightTools.svg?branch=master" alt="Travis-CI Build Status" /></a></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="right">dev</td>
<td align="left"><a href="https://travis-ci.org/iNZightVIT/iNZight"><img src="https://travis-ci.org/iNZightVIT/iNZight.svg?branch=dev" alt="Travis-CI Build Status" /></a></td>
<td align="left"><a href="https://travis-ci.org/iNZightVIT/iNZightPlots"><img src="https://travis-ci.org/iNZightVIT/iNZightPlots.svg?branch=dev" alt="Travis-CI Build Status" /></a></td>
<td align="left"><a href="https://travis-ci.org/iNZightVIT/iNZightModules"><img src="https://travis-ci.org/iNZightVIT/iNZightModules.svg?branch=dev" alt="Travis-CI Build Status" /></a></td>
<td align="left"><a href="https://travis-ci.org/iNZightVIT/iNZightTS"><img src="https://travis-ci.org/iNZightVIT/iNZightTS.svg?branch=dev" alt="Travis-CI Build Status" /></a></td>
<td align="left"><a href="https://travis-ci.org/iNZightVIT/iNZightMR"><img src="https://travis-ci.org/iNZightVIT/iNZightMR.svg?branch=dev" alt="Travis-CI Build Status" /></a></td>
<td align="left"><a href="https://travis-ci.org/iNZightVIT/iNZightRegression"><img src="https://travis-ci.org/iNZightVIT/iNZightRegression.svg?branch=dev" alt="Travis-CI Build Status" /></a></td>
<td align="left"><a href="https://travis-ci.org/iNZightVIT/iNZightMaps"><img src="https://travis-ci.org/iNZightVIT/iNZightMaps.svg?branch=dev" alt="Travis-CI Build Status" /></a></td>
<td align="left"><a href="https://travis-ci.org/iNZightVIT/iNZightTools"><img src="https://travis-ci.org/iNZightVIT/iNZightTools.svg?branch=dev" alt="Travis-CI Build Status" /></a></td>
<td align="left"></td>
</tr>
</tbody>
</table>

------------------------------------------------------------------------

To start developing iNZightVIT (assumes Linux):
-----------------------------------------------

1.  Create a new directory: `~/iNZight` (This must be in your home directory)

``` bash
mkdir ~/iNZight
cd ~/iNZight
```

1.  Inside `iNZight`, clone the `dev` repository (assumes git is set up):

``` bash
git clone git@github.com:iNZightVIT/dev
cd dev
```

1.  From inside the `dev` directory, build the full iNZight development directories:

``` bash
make build
cd ..
```

1.  Now, inside `~/iNZight/`, you will have all of the required directories for developing iNZight.

------------------------------------------------------------------------

Dependency Structure
--------------------

This graph shows the interaction between various iNZight R packages. ![Diagram](https://raw.githubusercontent.com/iNZightVIT/dev/master/iNZight_dependencies.png)

-   **Imports** = solid line
-   **Suggests** = dashed line
-   **Enhances** = dotted line
-   Lines in BLACK are OK as is
-   Lines in RED are dependencies that are marked for removal
-   Lines in GREEN are dependencies that are marked for addition
-   Lines in ORANGE are dependencies that are marked for adjustment

------------------------------------------------------------------------

If you have any issues with these instructions, please email `tom.elliott@auckland.ac.nz`.
