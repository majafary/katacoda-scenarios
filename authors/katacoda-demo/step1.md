At its basic, Katacoda provides a live terminal window and a pane for providing guided instructions. Let's try some of the UX Features provided by Katacoda

## Execute Commands on Terminal Window
> Click on the command to execute it in the terminal window  
`top`{{execute T1}}

> You can interrupt previously running commands  
`^C`{{execute ctrl-seq T1}}

> Let's interrupt the command and clear the terminal  
`clear`{{execute interrupt T1}}

> You can also create and run commands in a new Terminal Window  
`echo "I am Terminal 2"`{{execute T2}}

> You can copy simple commands  
`some-command`{{copy}}

> You can also copy entire code blocks to the clipboard  
<pre class="file" data-target="clipboard">
{
    "employee":{
        "name": "John Doe",
        "salary": 56000,
        "married": true
    }
}
</pre>