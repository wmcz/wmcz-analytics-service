# wmcz-analytics-service

Welcome to (an early version of) the WMCZ Analytics service! This repository has backend code which builds and releases various WMCZ related datasets to the world. The code is executed on Wikimedia Toolforge (under a tool called "wmcz").

# Implementation details

This repository consists of two parts:

* [generator](https://github.com/wmcz/wmcz-analytics-service/tree/master/generator): has logic for generating datasets that can be generated on Wikimedia Toolforge (from data available directly to Toolforge, or data that can be downloaded to Toolforge)
* [orchestrator](https://github.com/wmcz/wmcz-analytics-service/tree/master/orchestrator): orchestrates the data generation and updates the [public page with all the datasets](https://wmcz.toolforge.org/datasets/)

Both are covered in more detail below.

## generator

This part generates datasets using data that are available to Wikimedia Toolforge. Right now, there is only one task implemented in this way:

* [dashboard-data](https://github.com/wmcz/wmcz-analytics-service/tree/master/generator/dashboard-data): gathers data about WMCZ's courses from the Outreach Dashboard

## orchestrator

The orchestrator orchestrates the process of gathering all WMCZ-related data and publishing them via https://wmcz.toolforge.org/datasets/. List of available datasets is available below.

# Available datasets

## dashboard-data

Data about Wikimedia Czech Republic's courses, as contained in the [Outreach Dashboard](https://outreachdashboard.wmflabs.org/). This does not include data from the [education program extension](https://www.mediawiki.org/wiki/Extension:Education_Program) era yet.

Aggregated data about individual courses are gathered by generator (contained in this repo; see above for details). Data about individual edits are computed in internal Wikimedia Foundation's analytics cluster, and the code is available in [wmcz-analytics-wmf-cluster](https://github.com/wmcz/wmcz-analytics-wmf-cluster).
