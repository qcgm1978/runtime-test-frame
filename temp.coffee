expect(getIeHacks('ie5.0')).toEqual('* html')
       expect(getIeHacks('ie7')).toEqual(['*:first-child+html', 'html>body',':root *>','*+html'])
       expect(getIeHacks('ie11')).toEqual(['*+html',':root *>','html>/**/body'])
       expect(getIeHacks('ie9')).toBeUndefined()
       expect(getOtherHacks('mobile')).toEqual([':root *>','html>/**/body','@media screen and (max-device-width:'])
       expect(getOtherHacks('chrome2')).toEqual([':root *>','html>/**/body','body:nth-of-type(1)','body:first-of-type','@media screen and (-webkit-min-device-pixel-ratio:0)'])
       expect(getOtherHacks('chrome0.5')).toBeUndefined()
       expect(getOtherHacks('firefox1')).toEqual([':root *>','html>/**/body','html>body','x:-moz-any-link'])
       expect(getOtherHacks('firefox3')).toEqual([':root *>','html>/**/body','html>body','x:-moz-any-link','x:-moz-any-link, x:default'])