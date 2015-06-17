# from source: https://github.com/deleteme/store
# a simple wrapper around html5 local storage and cookies
# provides three methods to interact with data
#
# it automatically purges data from localStorage if it's full.
#
# set: key, value
#    stores the value in a key
#    returns the value
# get: key
#    retrieves the value in the key
#    returns the value
# expire: key
#    removes the data and the key
#    returns the value

LocalStorage = do ->
  localStorageSupported = do ->
    try
      `(('localStorage' in window) && window['localStorage'] !== null)`
    catch e
      false

  if localStorageSupported
    # will displace data until it can successfully save
    safeSet = (key, value) ->
      try
        localStorage.setItem key, value
        value
      catch e
        for num in [0..5]
          localStorage.removeItem localStorage.key localStorage.length - 1
        safeSet key, value
    {
      set: safeSet

      get: (key) ->
        value = localStorage.getItem(key)
        return value

      expire: (key) ->
        value = localStorage[key]
        localStorage.removeItem(key)
        value

      length: () ->
        return Object.keys(localStorage).length

      keys: ()->
        keys = []
        for i in [0...localStorage.length] 
          k = localStorage.key(i)
          keys.push(k)
        return keys

      clear: ()->
        localStorage.clear()

      dict: ()->
        d = {}
        for i in [0...localStorage.length]
          k = localStorage.key(i)
          v = JSON.parse(localStorage.getItem(k))
          d[localStorage.key(i)] = v
        return d
    }
  else
    createCookie = (name, value, days) ->
      if days
        date = new Date
        date.setTime(date.getTime() + (days*24*60*60*1000))
        expires = "; expires=" + date.toGMTString()
      else
        expires = ""

      document.cookie = name + "=" + value + expires + "; path=/"

      value

    getCookie = (key) ->
      key = key + "="
      for cookieFragment in document.cookie.split(';')
        return cookieFragment.replace(/^\s+/, '').substring(key.length + 1, cookieFragment.length) if cookieFragment.indexOf(key) == 0
      return null

    {
      set: (key, value) ->
        createCookie key, value, 1

      get: getCookie

      expire: (key) ->
        value = LocalStorage.get key
        createCookie key, "", -1
        value

      length: () ->
        len = document.cookie.split(";").length
        return len

      keys: ()->
        keys = (k.split("=",1) for k in document.cookie.split(';'))
        return keys

      clear: () ->
        # set the expiration of all cookies to the beginning of unix time (epoch)
        for cookie in document.cookie.split(';')
          eqPos = cookie.indexOf('=')
          name = if eqPos > -1 then cookie.substr(0,eqPos) else cookie
          document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT"

    }

