install.packages(c('repr', 'IRdisplay', 'evaluate', 'crayon', 'pbdZMQ', 'devtools', 'uuid', 'digest', 'magrittr'))


devtools::install_github('IRkernel/IRkernel')

IRkernel::installspec(user = FALSE)

‘magrittr’ 