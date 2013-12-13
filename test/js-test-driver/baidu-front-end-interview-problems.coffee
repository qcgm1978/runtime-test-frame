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
        selectorHacksIe=
            6: '* html'
            7:['*:first-child+html', 'html>body',':root *>','*+html']
            8:'html>/**/body'
            10:['*+html',':root *>','html>/**/body']
        getIeHacks=(browser)->
            arr=///ie(\d+)///.exec browser
            if arr is null
                return
            num=parseInt(arr[1])
            if num <=6
                return selectorHacksIe['6']
            if num >= 10
                return selectorHacksIe['10']
            selectorHacksIe[num]

        expect(getIeHacks('ie5.0')).toEqual('* html')
        expect(getIeHacks('ie7')).toEqual(['*:first-child+html', 'html>body',':root *>','*+html'])
        expect(getIeHacks('ie11')).toEqual(['*+html',':root *>','html>/**/body'])
        expect(getIeHacks('ie9')).toBeUndefined()
        selectorHacksStandard=
            val:[':root *>','html>/**/body']
            mobile:'@media screen and (max-device-width:'
            chrome:
                val:['body:nth-of-type(1)','body:first-of-type','@media screen and (-webkit-min-device-pixel-ratio:0)']
                relation:'>=1'
            firefox:
                val:['html>body']
                '1':['x:-moz-any-link']
                '3':['x:-moz-any-link, x:default']
                '3.5':['body:nth-of-type(1)','body:not(:-moz-handler-blocked)']
            safari:
                val:'html>body'
                2:['html:first-child','html[xmlns*=""] body:last-child']
                3:['html[xmlns*=""] body:last-child', 'body:nth-of-type(1)']
                '2<=n>=3.1' :['html[xmlns*=""]:root','*|html[xmlns*=""] ']
                '>=3':['body:nth-of-type(1)','body:first-of-type','@media screen and (-webkit-min-device-pixel-ratio:0)']
                '>=3.5':'body:first-of-type'
            opera:
                val:'html>body'
                '9.25':'*|html[xmlns*=""]'
                '<=9.27':'html:first-child'
                '>=9':['body:nth-of-type(1)','body:first-of-type']

        getOtherHacks=(browser)->
            arr=///([A-Za-z]+)(\d+)?///.exec browser
            if arr is null
                return
            browser=arr[1]
            num=parseInt(arr[2])
            ret=selectorHacksStandard.val
            switch
                when browser is 'mobile'
                    ret.concat selectorHacksStandard.mobile
                when browser is 'chrome' and num >=1
                    ret.concat selectorHacksStandard.chrome
                when browser is 'firefox'
                    ret=ret.concat selectorHacksStandard.firefox.val
                    if num>=1
                        ret=ret.concat selectorHacksStandard.firefox['1']
                    if num>=3
                        ret=ret.concat selectorHacksStandard.firefox['3']
                    if num>= 3.5
                        ret.concat selectorHacksStandard.firefox['3.5']
                    ret
                when browser is 'safari'

#        expect( ///([A-Za-z]+)(\d+)?///.exec 'chrome2').toEqual(['chrome2','chrome','2'])
#        expect(///(\w+)(\d+)?///.exec 'mobile').toEqual(['mobile','mobile',undefined])
        expect(getOtherHacks('mobile')).toEqual([':root *>','html>/**/body','@media screen and (max-device-width:'])
        expect(getOtherHacks('chrome2')).toEqual([':root *>','html>/**/body','body:nth-of-type(1)','body:first-of-type','@media screen and (-webkit-min-device-pixel-ratio:0)'])
        expect(getOtherHacks('chrome0.5')).toBeUndefined()
        expect(getOtherHacks('firefox1')).toEqual([':root *>','html>/**/body','html>body','x:-moz-any-link'])
        expect(getOtherHacks('firefox3')).toEqual([':root *>','html>/**/body','html>body','x:-moz-any-link','x:-moz-any-link, x:default'])
        attrHacks=
            ie6:['_','*','#','\9','!']
            other:
                val: '/**/'
                ie7:['*|#','\9','/*\**/','!']
                ie8:['\9','/*\**/','\0']
                ie9:['\9','\0','@media screen and (min-width:0\0)']
                ie10:['@media screen and (min-width:0\0)']
