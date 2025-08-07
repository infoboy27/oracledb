/*
 An example JavaScript for use within ORDS.
*/
function fib(n) {
    let fibarr=[0, 1];
    for(let i = 2; i< n +1; i++) {
        fibarr.push(fibarr[i-1]+fibarr[i-2]);
    }
    return fibarr[n];
}

if (length > 0) {
   response = {fib: fib(length)};
} else {
   ords_response.setStatus(400);
}
