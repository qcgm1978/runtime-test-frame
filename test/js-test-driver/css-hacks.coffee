'use strict'
describe '',->
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


        attrHacks=
            ie6:['_','*','#','\9','!']
            other:
                val: '/**/'
                ie7:['*|#','\9','/*\**/','!']
                ie8:['\9','/*\**/','\0']
                ie9:['\9','\0','@media screen and (min-width:0\0)']
                ie10:['@media screen and (min-width:0\0)']
        expect(getIeHacks('ie5.0')).toEqual('* html')
        expect(getIeHacks('ie7')).toEqual(['*:first-child+html', 'html>body',':root *>','*+html'])
        expect(getIeHacks('ie11')).toEqual(['*+html',':root *>','html>/**/body'])
        expect(getIeHacks('ie9')).toBeUndefined()
        expect(getOtherHacks('mobile')).toEqual([':root *>','html>/**/body','@media screen and (max-device-width:'])
        expect(getOtherHacks('chrome2')).toEqual([':root *>','html>/**/body','body:nth-of-type(1)','body:first-of-type','@media screen and (-webkit-min-device-pixel-ratio:0)'])
        expect(getOtherHacks('chrome0.5')).toBeUndefined()
        expect(getOtherHacks('firefox1')).toEqual([':root *>','html>/**/body','html>body','x:-moz-any-link'])
        expect(getOtherHacks('firefox3')).toEqual([':root *>','html>/**/body','html>body','x:-moz-any-link','x:-moz-any-link, x:default'])
