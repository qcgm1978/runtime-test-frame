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
                    ret

#        expect( ///([A-Za-z]+)(\d+)?///.exec 'chrome2').toEqual(['chrome2','chrome','2'])
#        expect(///(\w+)(\d+)?///.exec 'mobile').toEqual(['mobile','mobile',undefined])
        expect(getOtherHacks('mobile')).toEqual([':root *>','html>/**/body','@media screen and (max-device-width:'])
#        expect(getOtherHacks('chrome2')).toEqual([':root *>','html>/**/body','body:nth-of-type(1)','body:first-of-type','@media screen and (-webkit-min-device-pixel-ratio:0)'])
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
    it 'implicit conversion',->
        x=0.5
        y='0.5'
        expect(x+'').toEqual(String(0.5))
        expect(+y).toEqual(Number(y))
        expect(!!y).toEqual(Boolean(y))
    it 'overwrite valueOf and toString, valueOf takes precedence over toString',->
        Array.prototype.valueOf = ->
            return 10
        Array.prototype.toString = ->
            return '88'
        expect(!![]).toBeTruthy()
        expect([] + 1).toEqual(11)
        expect([] + '').toEqual('10')
        expect(Number([])).toEqual(10)
        expect(String([])).toEqual('88')
        Array.prototype.valueOf = null#                       // 令valueOf失效
        expect([] + 1).toEqual('881')#      // 结果为'881'，隐式转换valueOf不行后转到toString,得到原始值字符串直接返回
        expect(Number([])).toEqual(88)#  // 同理，结果为88

describe 'DOM (Document Object Model) events allow event-driven programming languages like JavaScript, JScript, ECMAScript, VBScript and Java to register various event handlers/listeners on the element nodes inside a DOM tree, e.g. HTML, XHTML, XUL and SVG documents.',->
    it 'Mouse event',->
        expect(document.body.onclick).toBeNull()
        document.body.onclick=->
        arrMouseEvents=['onclick','ondblclick','onmousedown','onmousemove','onmouseover','onmouseout	','onmouseup']
#        expect(document.body.onclick instanceof Function).toBeTruthy()
        expect(Event).toBeDefined()
#        expect(Event instanceof Function).toBeTruthy()
        expect(eve in Event).toBeFalsy() for eve in arrMouseEvents
        arrKeyboardEvents=['onkeydown','onkeypress	','onkeyup']
        expect(eve in Event).toBeFalsy() for eve in arrKeyboardEvents
        arrFrameObjEve=['onabort',        'onerror        ','onload	        ','onresize	        ','onscroll','onunload']
        expect(eve in Event).toBeFalsy() for eve in arrFrameObjEve
        arrFormEve=['onblur        ','onchange	        ','onfocus        ','onreset	        ','onselect','        onsubmit']
        expect(eve in Event).toBeFalsy() for eve in arrFormEve
        arrEveConst=['CAPTURING_PHASE	','        AT_TARGET	','        BUBBLING_PHASE']
        expect(eve in Event).toBeFalsy() for eve in arrEveConst
        arrUserInterface=['focusin	','        focusout	','        DOMActivate']
        expect(eve in Event).toBeFalsy() for eve in arrUserInterface
        arrMutation=['DOMSubtreeModified	' ,        'DOMNodeInserted	',        'DOMNodeRemoved	',        'DOMNodeRemovedFromDocument	',        'DOMNodeInsertedIntoDocument	',        'DOMAttrModified	',        'DOMCharacterDataModified']
        expect(eve in Event).toBeFalsy() for eve in arrMutation
        arrTouchEve=['touchstart',        'touchend',        'touchmove',        'touchenter'        ,'touchleave'        ,'touchcancel']
        expect(eve in Event).toBeDefined() for eve in Event
        expect(window.navigator.pointerEnabled).toBeUndefined()
#         As of October 2013, this event is only supported by Internet Explorer 10 and 11.
        if MSPointerEvent?
            expect(MSPointerEvent).toBeDefined()
    it 'Event object',->
        expect(document.body.onclick).toBeDefined()
        document.body.onclick= (e)->
            expect(e instanceof Object).toBeTruthy()
            arrEventProp=[
                'type',
                'target',
                'currentTarget',
                'eventPhase',
                'bubbles',
                'cancelable',
                'DOMTimeStamp'
            ]
            arrEveMethods=[
                'stopPropagation',
            'preventDefault',
            'initEvent'
            ]
            for val in arrEventProp
                expect(val in e).toBeDefined()
            for val in arrEveMethods
                expect(val in e).toBeDefined()
        expect(document.body.onclick instanceof Function).toBeTruthy()
        document.body.click()
    it 'Event handling models: DOM Level 2',->
        arrEveHandleMode=[
            'addEventListener' ,
            'removeEventListener',
            'dispatchEvent'
        ]
        for val in arrEveHandleMode
            expect(val in window).toBeDefined()
            expect(val in document).toBeDefined()
        arrHandleModeForIe=[
            'attachEvent' ,
            'detachEvent',
        ]
        expect( val of window).toBeTruthy() for val in arrHandleModeForIe when ///msie///i .exec navigator.userAgent

describe 'Relaxing the same-origin policy',->
    arrSolution=[
        'server proxy'
        {'document.domain property':
            pos:'client-side'
            example:"document.domain='the same origin'"
        }
        {'Cross-Origin Resource Sharing':
            pos:'server-side'
            example:"""$allowed_origins   = array(
                                    "http://www.example.com"   ,
                                    "http://app.example.com"  ,
                                    "http://cms.example.com"  ,
                                  );
        if (in_array($_SERVER['HTTP_ORIGIN'], $allowed_origins)){
            @header("Access-Control-Allow-Origin: " . $_SERVER['HTTP_ORIGIN']);
        }"""
        }
        {'JSONP':
            pos:'client-side'
            example:[
                """$.ajax({
            dataType: 'jsonp',
            data: 'id=10',
            jsonp: 'jsonp_callback',
            url: 'http://api.example.com/getdata',
            success: function () {
            // do stuff
            },
            });"""
                '<script type="text/javascript" src="http://api.example.com/getdata?jsonp=callback"></script>'
            ]
        }
        'Cross-document messaging':'postMessage'
    ]
    expect(arrSolution.length).toEqual(5)

describe 'HTML5',->
    it 'The <label> element does not render as anything special for the user. However, it provides a usability improvement for mouse users, because if the user clicks on the text within the <label> element, it toggles the control.',->
        html='<form action="demo_form.asp">
          <label for="male">Male</label>
          <input type="radio" name="sex" id="male" value="male"><br>
          <label for="female">Female</label>
          <input type="radio" name="sex" id="female" value="female"><br>
          <input type="submit" value="Submit">
        </form>'
#        label=new RegExp('\<label.*?for\s*\=\s*\"\s*(\w+)\"')
        label=///\<label.*?for\s*\=\s*\"\s*(\w+)\"///
        input=///\<input.*?id\s*\=\s*\"\s*(\w+)\"///
        arr=label.exec html
        arr1=input.exec html
        expect(arr[1]).toEqual('male')
        expect(arr1[1]).toEqual('male')
        expect(arr[1]).toEqual(arr1[1])

describe 'css basic property writting',->
    css='/*This is a comment*/
    p
    {
    text-align:center;
    /*This is another comment*/
    color:black;
    }'
    arr=['selector',{declaration:{'property','value'}}]
    expect(arr[1].declaration).toEqual({
        'property',
        'value'
    })
    reg=///
        (/\*.*?\*/)  #the first line comments
        .*?
                 (\w+) #selector
        .*
        \{.*?
             (([a-z-]+)\s*\:\s*(\w+)\s*\;) # declaration, property, value
        .*
        (/\*.*?\*/) # the second comments
        .*?
         (([a-z-]+)\s*\:\s*(\w+)\s*\;)
        .*\}$
        ///
    arrCode=reg.exec css
    expect(arrCode).toBeTruthy()
    expect(arrCode[1]).toEqual('/*This is a comment*/')
    expect(arrCode[2]).toEqual('p')
    expect(arrCode[3]).toEqual('text-align:center;')
    expect(arrCode[4]).toEqual('text-align')
    expect(arrCode[5]).toEqual('center')
    expect(arrCode[6]).toEqual('/*This is another comment*/')
    expect(arrCode[7]).toEqual('color:black;')

describe 'The data-* attributes is used to store custom data private to the page or application.',->
    pri='any attribute that starts with “data-” will be treated as a storage area for private data (private in the sense that the end user can’t see it – it doesn’t affect layout or presentation).'
    attach=' the best means of attaching raw data to HTML elements – in a valid manner'
    access='validation or needing to be val'
    document.body.data={pri,attach,access}
    expect(document.body.data).toEqual({pri,attach,access})
    document.body.data.temp='temp'
    expect(document.body.data.temp).toEqual('temp')

describe 'css reset',->
    why='The foundational CSS Reset removes the inconsistent styling of HTML elements provided by browsers. This creates a dependably flat foundation to build upon. With CSS Reset loaded, write explicit CSS your project needs.'
    source={yuiCssReset:'http://yui.yahooapis.com/3.14.0/build/cssreset/cssreset-min.css'}
    expect(document.body.style.fontSize).toEqual('')


