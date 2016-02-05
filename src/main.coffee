chrome.app.runtime.onLaunched.addListener ->
  screenWidth = screen.availWidth
  screenHeight = screen.availHeight
  width = 500
  height = 300
  chrome.app.window.create 'build/index.html',
    id: 'karogi'
    outerBounds:
      width: width
      height: height
      left: Math.round((screenWidth - width) / 2)
      top: Math.round((screenHeight - height) / 2)
