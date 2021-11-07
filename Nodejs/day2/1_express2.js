const { response } = require('express');
const express = require('express');
const app = express();

app.use((req,res)=>{
    console.log('첫번째 미들웨어 실행!');
    res.redirect('http://www.naver.com');
});

app.listen(3000, () => {
    console.log('3000번 포트로 서버 실행중 ...');
});