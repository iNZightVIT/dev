
<h2>Change Log for iNZight</h2>

<div class='versionSection'><h3>Changes in version 2.5</h3>

<p>Release date: 08 November, 2015
</p>


<h4>NEW FEATURES</h4>


<ul>
<li><p> specify colours for dotplots and scatterplots from the Add
to Plot &gt; Code more variables screen.
</p>
</li></ul>




<h4>PATCH 2.5.1 - 16/11/2015</h4>


<ul>
<li><p> correct the names and URLs in the 'Help &gt; User Guides' menu
</p>
</li>
<li><p> fix bug that occurs when 'Colour by' variable has only one
unique value
</p>
</li></ul>




</div>  <div class='versionSection'><h3>Changes in version 2.4</h3>

<p>Release date: 12 October, 2015
</p>


<h4>NEW FEATURES</h4>


<ul>
<li><p> Include FPC (finite population corrections) in survey designs
</p>
</li></ul>




<h4>MAJOR CHANGES</h4>


<ul>
<li><p> Replace the drag-drop boxes for variabes with drop-down
boxes for an alternative method of variable
selection. Drag-and-drop functionality has been retained.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li><p> Fix the enabling/disabling of buttons when survey designs
are specified.
</p>
</li>
<li><p> When closing the survey design window, they specified design
is now checked for validity before saving the design.
</p>
</li>
<li><p> Fix bug in the Multiple Response module that gave an
&quot;inverse&quot; error message.
</p>
</li>
<li><p> Various other small fixes throughout iNZight and other
dependency pacakges. See their change logs for details.
</p>
</li></ul>




<h4>PATCH 2.4.1 - 21/10/2015</h4>


<ul>
<li><p> Remove dependency on <code>RODBC</code> package; this causes
issues on Mac attempting to manually install.
</p>
</li></ul>




<h4>PATCH 2.4.2 - 28/10/2015</h4>


<ul>
<li><p> Add option to display labels internally on numeric x factor
</p>
</li>
<li><p> Fix from iNZightPlots for Get Summary (n.missing now correct)
</p>
</li></ul>




<h4>PATCH 2.4.3 - 02/11/2015</h4>


<ul>
<li><p> Improve smoothness of dotplot transitions by only redrawing
when the scaling has changed.
</p>
</li></ul>




</div>  <div class='versionSection'><h3>Changes in version 2.3</h3>

<p>Release date: 4 August, 2015
</p>


<h4>NEW FEATURES</h4>


<ul>
<li><p> SURVEY DESIGNS: iNZight can now handle survey designs
(currently Strata, 2-stage (nesting) clustering, and a weighting
variable. Plots take account of this structure and inference that
displays (currently only trend lines on bivariate plots) use
functions from the 'survey' packages and thus incorporate weights.
</p>
</li>
<li><p> Adjust the axis limits from the Add to Plot menu.
</p>
</li>
<li><p> Adjust the number of bars displayed on a bar plot from the
Add to Plot menu.
</p>
</li></ul>




<h4>MINOR CHANGES</h4>


<ul>
<li><p> the plot tool bar has been added to the Menubar at the top
of the page. This allows users to work in a dual-window mode
(with a narrow iNZight interface and a separate plotting window)
and still be able to access plot functions.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li><p> fixes to a few issues occuring in dotplots
</p>
</li>
<li><p> display an error if Add to Plot is called without any
variables having been selected
</p>
</li></ul>




</div>  <div class='versionSection'><h3>Changes in version 2.2.0-1</h3>

<p>Release date: 01 July 2015
</p>


<h4>PATCHES</h4>


<ul>
<li><p> iNZightPlots package: fix colour of segmented bar plots to
match the legend
</p>
</li></ul>




</div>  <div class='versionSection'><h3>Changes in version 2.2</h3>

<p>Release date: 16 June 2015
</p>


<h4>NEW FEATURES</h4>


<ul>
<li><p> users can specify a window size in File &gt; Preferences
</p>
</li>
<li><p> Links to the User Guides found on our website have been
added, including help buttons in the Add To Plot and Inference
Information windows.
</p>
</li></ul>




<h4>MAJOR CHANGES</h4>


<ul>
<li><p> LOCATE functionality now included for dot plots. Also fixes
several bugs in the previous update for locating points in a
scatter plot.
</p>
</li></ul>




<h4>MINOR CHANGES</h4>


<ul>
<li><p> the &quot;Row Operations&quot; menu has been renamed &quot;Data&quot;
</p>
</li></ul>




<h4>PATCH 2.2.0-1 (01 July 2015)</h4>


<ul>
<li><p> iNZightPlots package: fix colour of segmented bar plots to
match the legend
</p>
</li></ul>




<h4>PATCH 2.2.0-2 (27 July 2015)</h4>


<ul>
<li><p> Fix mapping of confidence intervals (instead of comparison
intervals) to Year 12 intervals in dot plots.
</p>
</li></ul>




</div>  <div class='versionSection'><h3>Changes in version 2.1.1</h3>

<p>Release date: 09 June 2015
</p>


<h4>BUG FIXES</h4>


<ul>
<li><p> fix a dependency issue required for aggregating data sets
</p>
</li></ul>




</div>  <div class='versionSection'><h3>Changes in version 2.1</h3>

<p>Release date: 25 May 2015
</p>


<h4>NEW FEATURES</h4>


<ul>
<li><p> New hexagonal binning plot available to large samples
</p>
</li>
<li><p> Live updating sliders for the &quot;Add to Plot&quot; panel, which is
now embedded into the main window rather than creating an
additional pop-up window
</p>
</li></ul>




<h4>MAJOR CHANGES</h4>


<ul>
<li><p> The &quot;Add to Plot&quot;, &quot;Remove Additions&quot; and
&quot;Inference Information&quot; windows have been integrated into the main
window with the aim of making the interface cleaner and easier to
navigate.
</p>
</li>
<li><p> When colouring points by a numeric variable, a continuous colour
range is used rather than a discrete one.
</p>
</li>
<li><p> The plotting package has been rewritten to accomodate survey
designs (this will be integrated with iNZight itself at a later
date). However, the plots have been modified to be cleaner and far
more efficient. Additionally, the algorithms used for the
inference information have been updated. For more information on
this, see the iNZightPlots change log.
</p>
</li>
<li><p> The &quot;Get Summary&quot; and &quot;Get Inference&quot; outputs have been
redesigned to hopefully give a more intuitive, cleaner
presentation of the information.
</p>
</li>
<li><p> From dot plots and histograms, the comparison (and confidence)
interval values can be read from the graph by clicking 'Get Values'
in the 'Inference Information' panel. This includes the Year 12 intervals
applied to medians.
</p>
</li>
<li><p> LOCATOR: functionality for scatterplots vastly improved,
allowing selection of related points, retaining points over
multiple graphcs, and selecting points by a variable.
(similar upgrades for dot plots coming in v2.2)
</p>
</li></ul>




<h4>MINOR CHANGES</h4>


<ul>
<li><p> the number of missing values is now displayed on the plot,
broken down by variable
</p>
</li>
<li><p> the list of options in the 'Add to Plot' window are now in a drop
down menu, rather than radio buttons, to save space
</p>
</li>
<li><p> many other small UI improvements
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li><p> if 'colour by' is set, but the graph is changed to a histogram,
the legend is removed from the plot
</p>
</li>
<li><p> fixes a bug in the plotting that was causing large values to fall off the axes
of the plots
</p>
</li>
<li><p> includes other patches from the previous version of iNZight
</p>
</li></ul>




</div>  <div class='versionSection'><h3>Changes in version 2.0.4</h3>

<p>Release date: 18 November 2014
</p>


<h4>NEW FEATURES</h4>


<ul>
<li><p> The data set name is displayed above the data view
</p>
</li>
<li><p> The variable type is now displayed as a prefix to the variable
names in the variable view
</p>
</li>
<li><p> A new &quot;Updates Available&quot; shows up when new versions are
released
</p>
</li>
<li><p> A new Help tab that includes Licence information, and a link
to the FAQ and Support pages
</p>
</li></ul>




<h4>MINOR CHANGES</h4>


<ul>
<li><p> In the &quot;Remove Additions&quot; window, &quot;Remove segmentation&quot; has
been renamed to &quot;Remove colour by&quot; for bar plots, and
&quot;Restore default labels&quot; is added to remove customised plot
labels
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li><p> Removes development text from Load Data window
</p>
</li>
<li><p> Fixes a bug in the Locate Points feature when the scales are
vastly different
</p>
</li>
<li><p> Scroll bars added to Reorder Levels window
</p>
</li>
<li><p> The menu has been moved above the plot tabs, so it no longer
gets cut off
</p>
</li></ul>




<h4>Patch 2.0.4-1</h4>

<p>Date: 12-12-2014
</p>

<ul>
<li><p> fixed up the plot device in Time Series on Linux machines
</p>
</li></ul>




<h4>Patch 2.0.4-3</h4>

<p>Date: 10-02-2015
</p>

<ul>
<li><p> fix a bug causing write-protected directories to crash
</p>
</li></ul>




<h4>Patch 2.0.4-4</h4>

<p>Date: 10-03-2015
</p>

<ul>
<li><p> ping for an internet connection before trying to check for updates
</p>
</li></ul>




</div>  <div class='versionSection'><h3>Changes in version 2.0.3</h3>

<p>Release date: 17 September 2014
</p>


<h4>MAJOR CHANGES</h4>


<ul>
<li><p> A new Multiple Response analysis module has been added to the
Advanced menu. This utilises the iNZightMR package developed by
Junjie Zeng
</p>
</li></ul>




<h4>MINOR CHANGES</h4>


<ul>
<li><p> &quot;Add to Plot&quot; window modified for barcharts - can show onlyake
CIs, and also selects comparison and confidence intervals by default
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li><p> Includes a suite of bug fixes in the iNZightPlots package - see its
NEWS file for these
</p>
</li></ul>




</div>  <div class='versionSection'><h3>Changes in version 2.0.2</h3>

<p>Release date: 17 June 2014
</p>


<h4>NEW FEATURES</h4>


<ul>
<li><p> can now cycle through all two-variable plots for a selected
Variable 1
</p>
</li>
<li><p> &quot;play&quot; button for the first subset by variable
(automatically cycle levels)
</p>
</li>
<li><p> data manipulation features added and modified
</p>
</li></ul>




<h4>MINOR CHANGES</h4>


<ul>
<li><p> can now specify to identify min/max points in a dot plot
</p>
</li>
<li><p> in the Add to Plot window for barcharts, reworded &quot;segment by&quot; to &quot;colour by&quot;
for consistency.
</p>
</li>
<li><p> the transparency slider now runs from 0
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li><p>  identify functionality works for subsets (except when multi plots at once)
</p>
</li></ul>




</div>  <div class='versionSection'><h3>Changes in version 2.0.1</h3>

<p>Release date: 27 March 2014
</p>


<h4>NEW FEATURES</h4>


<ul>
<li><p> Identify feature added to the &quot;Add To Plot&quot; menu. This
allows users to interactively label points with 'id' or any other
variable. This feature works for both dot plots and scatter plots.
</p>
</li></ul>




<h4>MINOR CHANGES</h4>


<ul>
<li><p> Users can force scatter plots when the sample size is large,
rather than using the alternative grid-density plot.
</p>
</li>
<li><p> Missing observations can be converted to categorical
levels. For categorical variables, the result is a new factor with
the same levels as the original variable, but the additional
'missing' factor level. For continuous variables, a new factor
variable with two levels, 'missing' and 'not missing' is created.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li><p> Vertical sliders added to the 'Rename Levels' and 'Rename
factor levels' windows.
</p>
</li>
<li><p> Reorder levels now works as expected, including sort by
frequency.
</p>
</li>
<li><p> Bug where the iNZight window closes even if a user clicks
'cancel' has been fixed.
</p>
</li></ul>




</div>  <div class='versionSection'><h3>Changes in version 2.0.0</h3>

<p>Release date: 18 January 2014
</p>


<h4>MAJOR RELEASE</h4>


<ul>
<li><p> The entire iNZight module of iNZightVIT has been rewritten,
with a multitude of changes along the way.
</p>
</li></ul>




</div>
