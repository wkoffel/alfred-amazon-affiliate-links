## Alfred 2 Amazon Affiliate Link Generator Workflow

An [Alfred](http://www.alfredapp.com/ "Alfred App") workflow for generating simple [Amazon Affiliate](http://affiliate-program.amazon.com) links with your own tag.  Designed for anyone who generates a lot of custom links from URLs.  This workflow will clean up all the parameters from an amazon.com URL, and then append the configured tag to it.

![Screenshot: Alred Workflow Topology](https://raw.github.com/wkoffel/alfred-amazon-affiliate-links/master/screenshots/workflow.png "Workflow Topology")


### Setting Your Affiliate Code

The keyword trigger *alink code <your-affiliate-tag>* will set a new affiliate code, which all subsequent calls to *alink* will use.

![Screenshot: Set Affiliate Code](https://raw.github.com/wkoffel/alfred-amazon-affiliate-links/master/screenshots/set-affiliate-code.png "Set Affiliate Code")


### Generating Links

The keyword trigger *alink <an-amazon-product-url>* will strip extra junk from the URL (all the query params, which aren't necessary for Amazon product links), and append "tag=your-affiliate-tag" to it, copying the result to the clipboard.

![Screenshot: Generate Affiliate Link](https://raw.github.com/wkoffel/alfred-amazon-affiliate-links/master/screenshots/generate-affiliate-link.png "Generate Affiliate Link")

You will get an error message if you haven't set an affiliate code yet (see above), or if the target link is not a valid Amazon link.

### Install Notes

Download the compiled workflow directly at http://cl.ly/image/2F3I3w3s0E1F

Visit the repository for the full source code at https://github.com/wkoffel/alfred-amazon-affiliate-links/

In theory, I've bundled all the necessary ruby gems in the workflow package proper, so it should be a simple double-click install.  If you do need to install manually, please let me know.  To install manual dependencies, you would run just "sudo gem install alfredo addressable", and that should suffice.

This has been tested on OS X 10.13 High Sierra. The necessary gems for earlier ruby versions may still be bundled, so give it a try.  Reach out if anything doesn't work for you, so we can update these notes.

### Credits

Thanks to Bryan McKelvey for the simple [Alfredo Gem](https://github.com/brymck/alfredo "Alfredo Ruby Gem")
Thanks to phyllisstein for [Alleyoop](http://www.alfredforum.com/topic/1582-alleyoop-update-alfred-workflows/ "Alleyoop Workflow Updater")

### Release Notes

* v1.0 (Feb 24, 2014) - Initial release
* v1.1 (Mar 24, 2018) - Support for Alfred 3 and macOS 10.13
