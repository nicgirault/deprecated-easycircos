describe "angularjs homepage todo list", ->
  it "should add a todo", ->
    browser.get "http://127.0.0.1:3000"
    
    newTrackButton = element(`by`.id('newTrack'))
    newTrackButton.element(`by`.css('button')).click()

    newTrackButton.element.all(`by`.repeater('trackType in trackTypes')).
    element(`by`.linkText('Heatmap')).
    click()
    browser.sleep(10000)
    return

  return
