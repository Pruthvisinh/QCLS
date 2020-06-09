function resizeCanvas(canvas) {
    var ratio =  Math.max(window.devicePixelRatio || 1, 1);
    // canvas.width = canvas.offsetWidth * ratio;
    // canvas.height = canvas.offsetHeight * ratio;
    // console.log(canvas.height)
    // console.log(canvas.width)
    console.log(ratio)
    canvas.getContext("2d").scale(ratio, ratio);
}
