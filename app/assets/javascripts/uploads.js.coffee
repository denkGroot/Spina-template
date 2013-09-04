 # Upload photo
$.fn.uploadPhoto = ->
  $(this).fileupload
    dataType: "script"
    singleFileUploads: true
    dropZone: $(this).find('.photo-field')
    maxNumberOfFiles: 1
    add: (e, data) ->
      types = /(\.|\/)(gif|jpe?g|png)$/i
      file = data.files[0]
      if types.test(file.type) || types.test(file.name)
        NProgress.start()
        $(this).find('.customfile').addClass('loading')
        data.submit()
      else
        alert("#{file.name} is geen gif-, jpeg- of png-bestand")
    progress: (e, data) ->
      if data.context
        NProgress.set(data.loaded / data.total)
    done: (e, data) ->
      $(this).find('.customfile').removeClass('loading')
      NProgress.done()
