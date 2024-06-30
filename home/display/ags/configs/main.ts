const Window = Widget.Window({
    name: "bar",
    child: Widget.Box([
        Widget.ProgressBar({
            value: 0.3
        })
    ]),
    anchor: ['bottom', "left", "right"],
    isFocus: true,
    
})


App.config({
    windows: [
        Window
    ],
})
