Katacoda's built-in text editor makes working with files easier. Updates to files in the text editor are saved automatically.

To demonstrate, we will create a simple NodeJS Express application.

## Pre-open Files in the Editor
> We configured the editor to open a file named resp.js when this scenario loads. Click on the below snippet to insert it into the file
<pre class="file" data-filename="resp.js" data-target="replace">
#TODO-insert
module.exports = { message };
</pre>

## Create and Open A New File
> Click on the command to create a new app.js file
`touch app.js`{{execute T1}}

> We can click to open this file
`app.js`{{open}}

## Continue Creating Guided Instructions
> You can specify the target file for the code snippet
<pre class="file" data-filename="app.js" data-target="replace">
var requestListener = function (req, res) {
    res.writeHead(200);
    res.end(message);
}
</pre>

## Prepend Code
> You can prepend code to the target file  
<pre class="file" data-filename="app.js" data-target="prepend">
const { message } = require('./resp');
const http = require('http');
</pre>

## Append Code  
<pre class="file" data-filename="app.js" data-target="append">
var server = http.createServer(requestListener);
server.listen(3000, function() {
    console.log("Listening on port 3000");
});
</pre>

## Insert Code in Specific Positions  
> Use data markers to insert code in pre-determined positions
<pre class="file" data-filename="resp.js"  data-target="insert" data-marker="#TODO-insert">
const message = 'Hello, World!';
</pre>>