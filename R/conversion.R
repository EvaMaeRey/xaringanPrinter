


slides_pdf <- function(url){

pagedown::chrome_print(input = url)

}

pdf_gif <- function(path,
                    output = paste0(gsub('pdf$', '', path), "gif"),
                    density = 100,
                    delay = NULL
                    ){

# then create gif as follows
images <- magick::image_read_pdf(path = path, density = density) # create images

if (is.null(delay)) {

delay <- (1/(1:length(images))) + .1

}

magick::image_write_gif(images, path = output, delay = delay) # images to gif

}
