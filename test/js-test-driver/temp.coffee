'use strict'
describe '',->
    it '',->
        url='http://xenodesystems.blogspot.com/2013/07/actualizarmigrar-ruby-20-y-rails-4-sin.html'
        urls = [
          'http://xenodesystems.blogspot.mx/2013/07/actualizarmigrar-ruby-20-y-rails-4-sin.html',
          'http://xenodesystems.blogspot.it/2013/07/actualizarmigrar-ruby-20-y-rails-4-sin.html',
          'http://xenodesystems.blogspot.fr/2013/07/actualizarmigrar-ruby-20-y-rails-4-sin.html',
          'http://xenodesystems.blogspot.com.au/2013/07/actualizarmigrar-ruby-20-y-rails-4-sin.html',
        ]
        reg=///
        (?=blogspot)(\.[a-zA-Z]+)+
        ///
        urlNew=urls[1].replace(reg,'.com')
        expect(urlNew).toEqual(url)
#        expect(val.replace(reg,'xenodesystems.blogspot.com')).toEqual(url) for val in urls



