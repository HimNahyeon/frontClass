function getPresent(){
    console.log('🎁');
}

function setJumsu(jumsu){
    console.log(`전달받은 점수는 ${jumsu}입니다`);
}

function getTotal(start=0, end=0){
    let sum = 0;
    for(let i=start; i<=end; i++){
        sum+=i;
    }
    console.log(`${start}부터 ${end}까지의 총합은 ${sum}입니다.`);
}


function setNumbers(num1, ...num2){
    console.log(`num1의 값 : ${num1}`);
    console.log(`num2의 값 : ${num2}`);
}

function setMath(...math){
    for(let i of math){
        console.log(i);
    }
}


//리턴 값 있는 함수
function getHeart(){
    return '❤';
}



//사칙연산  내가한거 오답.. ㅠ_ㅠ

function total(number1,number2){
    let number1 = Number(prompt('첫번째 숫자를 입력하세요 : '));
    let number2 = Number(prompt('두번째 숫자를 입력하세요 : '));
        return number1 + number2;
}
function minus(number1,number2){
    let number1 = Number(prompt('첫번째 숫자를 입력하세요 : '));
    let number2 = Number(prompt('두번째 숫자를 입력하세요 : '));
        return number1 - number2;
}
function multi(number1,number2){
    let number1 = Number(prompt('첫번째 숫자를 입력하세요 : '));
    let number2 = Number(prompt('두번째 숫자를 입력하세요 : '));
        return number1 * number2;
}
function divide(number1,number2){
    let number1 = Number(prompt('첫번째 숫자를 입력하세요 : '));
    let number2 = Number(prompt('두번째 숫자를 입력하세요 : '));
        return number1 / number2;
}