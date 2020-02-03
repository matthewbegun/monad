docker stop notbook > $null
docker run --rm -dit `
    --name notbook `
    -p 8888:8888 `
    -v jovyan:/home/jovyan `
    -v ${PWD}:/home/jovyan/work `
    monad `
    start.sh jupyter notebook --NotebookApp.token=''
start http://localhost:8888/tree
