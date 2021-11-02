const sendit = function(){ 
    // alert('sendit()호출!'); 

    //아이디 입력이 안됐을시에 
    const userid = document.getElementById('userid');
    //패스워드도..
    const userpw = document.getElementById('userpw');
    //비밀번호확인
    const userpw_re = document.getElementById('userpw_re');
    //이름 객체 선언
    const name = document.getElementById('name');
    //휴대폰번호 객체선언
    const hp = document.getElementById('hp');
    //이메일
    const email = document.getElementById('email');
    //취미
    const hobby = document.getElementsByName('hobby[]');  //id가 없기때문에 name으로 가져옴

    const isssn = document.getElementById('isssn');



    //정규표현식   , 이름에 한글만 입력받을 수 있게
    const expNameText = /[가-힣]+$/;     // [범위] : 시작글자 '가' 마지막글자 '힣' 
                                        // $ <- 정규표현식의 끝을나타냄 
    const expHpText = /^\d{3}-\d{3,4}-\d{4}$/;     // ^  : 이걸로 시작해라. 라는뜻
                                                    // \d : decimal   정수만넣어라! {3} 세자리!
                                                    // - 하이픈이 꼭들어가야된다!
                                                    // 정수만넣어라!  3자리 또는 4자리
                                                    // 하이픈 들어가야.
                                                    // 정수로 네자리 넣어라! $ 끝내라
    const expEmailText = /^[A-Za-z0-9\.\-]+@[A-Za-z0-9\.\-]+\.[A-Za-z0-9\.\-]+$/;
                        //^ ->   [A-Za-z0-9\.\-] 요범위로 시작해라
                        // 대문자 A-Z, 소문자 a-z , 숫자 0-9, 점,하이픈 두개의 특수문자 들어갈수 있음
                        // + 앞의 범위 글자의 갯수 관계없다!! 
                        // @   [범위]
                        //\.[A-Za-z0-9\.\-]   특수문자.(점) [범위]
                        // + 앞의 글자의 갯수 관계없다!! 
                        // $ 끝

    

    if(userid.value == ''){
        alert('아이디를 입력하세요');
        userid.focus();
        return false;
    }

    //아이디가 4자 이상 20자이하 일때만 입력되고 나머지는 에러.

    if(userid.value.length < 4 || userid.value.length>20){
        alert('아이디를 4자이상 20자 이하로 입력하세요');
        userid.focus();
        return false;
    }

    if(userpw.value == ''){
        alert('패스워드를 입력하세요');
        userpw.focus();
        return false;
    }

    //아이디가 4자 이상 20자이하 일때만 입력되고 나머지는 에러.

    if(userpw.value.length < 4 || userpw.value.length>20){
        alert('패스워드를 4자이상 20자 이하로 입력하세요');
        userpw.focus();
        return false;
    }

    //비밀번호 확인
    if(userpw.value != userpw_re.value){
        alert('비밀번호와 비밀번호확인의 값이 다릅니다.');
        userpw_re.focus();
        return false;
    }

    //이름검사
    if(!expNameText.test(name.value)){
        alert('이름 형식을 확인하세요\n한글만 입력 가능합니다.');
        name.focus();
        return false;
    }

    //휴대폰번호 검사
    if(!expHpText.test(hp.value)){
        alert('휴대폰 번호 형식을 확인하세요');
        hp.focus();
        return false;
    }

    //이메일 형식 검사
    if(!expEmailText.text(email.value)){
        alert('이메일 형식을 확인하세요');
        email.focus();
        return false;
    }


    //취미체크박스 배열 검사
    let count = 0;
    for(let i in hobby){ //for in문이라 배열의 인덱스가 i 로 넘어감
        if(hobby[i].checked){
            count++;
        }
    }

    if(count == 0){
        alert('취미는 적어도 1개이상 선택하세요');
        return false;
    }
   
    const moveFocus = function(){
        const ssn1 = document.getElementById('ssn1');
        if(ssn1.value.length >= 6){
            document.getElementById('ssn2').focus();
        }
    }

  
    return true; //페이지가 안넘어가게 처리 "진행하지마라!"
       
}

const ssnCheck = function(){
    const ssn1 = document.getElementById('ssn1');
    const ssn2 = document.getElementById('ssn2');
    const isssn = document.getElementById('isssn');

    if(ssn1.value == "" || ssn2.value == ""){
        alert('주민등록번호를 입력하세요');
        ssn1.focus();
        return false;
    }

    //앞자리에 001011 이라고 넣고 3068518이라고 넣었다고 했을때.
    const ssn = ssn1.value + ssn2.value;   //앞,뒤 자리 합쳐라
    const s1 = Number(ssn.substr(0, 1)) * 2; 
    const s2 = Number(ssn.substr(1, 1)) * 3;
    const s3 = Number(ssn.substr(2, 1)) * 4;
    const s4 = Number(ssn.substr(3, 1)) * 5;
    const s5 = Number(ssn.substr(4, 1)) * 6;
    const s6 = Number(ssn.substr(5, 1)) * 7;
    const s7 = Number(ssn.substr(6, 1)) * 8;
    const s8 = Number(ssn.substr(7, 1)) * 9;
    const s9 = Number(ssn.substr(8, 1)) * 2;
    const s10 = Number(ssn.substr(9, 1)) * 3;
    const s11 = Number(ssn.substr(10, 1)) * 4;
    const s12 = Number(ssn.substr(11, 1)) * 5;
    const s13 = Number(ssn.substr(12, 1)); //마지막자리 놔두기

    let result = s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12; //총합
    result = result % 11;
    result = 11 - result;
    if(result >= 10) result = result % 10;

    if(result == s13){
        alert('유효한 주민등록번호입니다');
        isssn.value = 'y';
        
    }else{
        alert('유효하지 않은 주민등록번호입니다');
    }
}