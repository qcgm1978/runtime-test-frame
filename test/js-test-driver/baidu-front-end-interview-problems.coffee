'use strict'
describe 'this is a test for the interview problems of Baidu front-end from internet',->
    it 'data type',->
        expect(Function instanceof Object).toBeTruthy()
        expect(Array instanceof Object).toBeTruthy()
#        http://www.w3schools.com/js/js_datatypes.asp
        arr=[Object,Array,Number,String,Boolean,null,undefined]
        expect(arr.length).toEqual(7)
    it 'how to get an id',->
        body=document.body
        expect(body).toBeDefined()
        expect(body.id).toEqual('')
        body.id='test-id'
        expect(body.id).toEqual('test-id')
    it 'how to get all elements in the following code',->
        ele=
            form:
                    input:'text'
                    input1:"text"
        arr=[ele.form,ele.form.input,ele.form.input1]
        expect(arr.length).toEqual(3)
    it 'how to add event to a element',->
        a=
            href:""
        a.event=->
            false
        expect(a.event).toBeDefined()
    it 'what is <!DOCTYPE>',->
        docType=
          definition:'The DocumentType interface represents a Node containing a doctype.'
          method:'Inherits methods from its parent, Node, and implements the ChildNode interface.'
        isNode=///node///i.exec(docType.definition)
        isChildInterface=///\schildnode\sinterface///i.exec docType.method
        expect(isNode).toBeDefined()
        expect(isChildInterface).toBeDefined()
    it 'three columns layout',->
        left='left'
        body={
            margin:0
            padding:0
        }

        maincontainer={
            width: '840px'
            margin: '0 auto'
        }
        
        topsection={
            height: '90px'
        }
        
        contentwrapper={
            float: left
            width: '100%'
        }
        
        contentcolumn={
            margin: '0 190px 0 180px'
        }
        
        leftcolumn={
            float: left
            width: '180px '
            marginLeft: '-840px'
        }
        
        rightcolumn={
            float: left
            width: '190px'
            marginLeft: '-190px '
        }
        
        footer={
            clear: left
            width: '100%'
        }
        arr=[body,maincontainer,topsection,contentwrapper,contentcolumn,leftcolumn,rightcolumn,footer]
        expect(arr.length).toEqual(8)
    it 'box model',->
        ele=
            width:'250px'
            padding:'10px'
            border:'5px solid gray'
            margin:'10px'
        eleWidth='300px'
        expect(parseInt(ele.width)+parseInt(ele.padding)*2+parseInt(ele.border)*2+parseInt(ele.margin)*2).toEqual(parseInt(eleWidth))
    it 'block and inline element and diferences between them',->
        block=['h1', 'p', 'ul', 'table','others']
        str="""b, big, i, small, tt
        abbr, acronym, cite, code, dfn, em, kbd, strong, samp, var
        a, bdo, br, img, map, object, q, script, span, sub, sup"""
        inline=str.split(///[,\n]///)
        expect(inline.length).toEqual(26)
        attr='the browser will display a line break before and after it'
        block.attr=attr
        expect(block.attr).toBeDefined()
        expect(inline.attr).toBeUndefined()
    it 'CSS Selector Hacks',->
        general='html>/**/body'
        common='html>body'
        group1=['IE7, FF, Saf, Opera','html>body']
        hack=
            ie6:  ['* html']
            ie7:['*:first-child+html']
            ff:[common]
            saf:[common]
            opera:[common]
        expect(hack['ie6']).toEqual(['* html'])
        getSelectorHack= (browser)->
            str='ie6'
            num = 6
            arr=[]
            browserNum=///(.*)(\d)///.exec browser
            if browserNum[1] is 'ie'
                if browserNum[2]<=6
                    return hack[str]
                reg=new RegExp(browser)
                if reg.exec group1[0]
                    arr = hack[browser][...]
                    arr.push group1[1]
                    return arr
            if val
                arr.push(val)
            val = hack[browser]
            arr.push(general)
            result=switch true
                    when browser==++num then hack[String(browser)]
                    else arr
        expect(getSelectorHack('ie5')).toEqual(hack.ie6)
        expect(getSelectorHack('ie7')).toEqual(['*:first-child+html','html>body'])
#        expect(getSelectorHack(8)).toEqual(['html>/**/body'])
#        expect(getSelectorHack('ff')).toEqual(['html>body','html>/**/body'])
#        expect(getSelectorHack('opera')).toEqual(['html>body','html>/**/body'])
        ###

     Opera 9.27 and below, safari 2 
    html:first-child #cinco { color: red }

     Safari 2-3 
    html[xmlns*=""] body:last-child #seis { color: red }

     safari 3+, chrome 1+, opera9+, ff 3.5+ 
    body:nth-of-type(1) #siete { color: red }

     safari 3+, chrome 1+, opera9+, ff 3.5+ 
    body:first-of-type #ocho { color: red }

     saf3+, chrome1+ 
    @media screen and (-webkit-min-device-pixel-ratio:0) {
    #diez { color: red }
    }

     iPhone / mobile webkit 
    @media screen and (max-device-width: 480px) {
    #veintiseis { color: red }
    }


     Safari 2 - 3.1 
    html[xmlns*=""]:root #trece { color: red }

     Safari 2 - 3.1, Opera 9.25 
    *|html[xmlns*=""] #catorce { color: red }

     Everything but IE6-8 
    :root *> #quince { color: red }

     IE7 
    *+html #dieciocho { color: red }

     IE 10+ 
    @media screen and (-ms-high-contrast: active), (-ms-high-contrast: none) {
    #veintiun { color: red; }
    }

     Firefox only. 1+ 
    #veinticuatro, x:-moz-any-link { color: red }

     Firefox 3.0+ 
    #veinticinco, x:-moz-any-link, x:default { color: red }

     FF 3.5+ 
    body:not(:-moz-handler-blocked) #cuarenta { color: red; }


    **** Attribute Hacks *****

     IE6 
    #once { _color: blue }

     IE6, IE7 
    #doce { *color: blue;  or #color: blue  }

     Everything but IE6 
    #diecisiete { color: blue }

     IE6, IE7, IE8, but also IE9 in some cases :( 
    #diecinueve { color: blue\9; }

     IE7, IE8 
    #veinte { color\*: blue\9; }

     IE6, IE7 -- acts as an !important 
    #veintesiete { color: blue !ie; }  string after ! can be anything 

     IE8, IE9 
    #anotherone {color: blue\0/;}  must go at the END of all rules 

     IE9, IE10 
    @media screen and (min-width:0\0) {
    #veintidos { color: red}
    }
###