function BottomPanelApp() {
  const { useState } = React;
  const { useEffect } = React;
  const { useRef } = React;
  const [isPanelOpen, setIsPanelOpen] = useState(false);
  const [formData, setFormData] = useState({ name: '', phone: '', email: '', message:'', check: false});
  const [errors, setErrors] = useState({});
  const [isFormVisible, setIsFormVisible] = useState(true);
  const [isLoading, setIsLoading] = useState(false);


  async function getData() {
    try {
      const response = await fetch('http://localhost:3000/posts/');
      
      // Проверяем, прошел ли запрос успешно
      if (!response.ok) {
        throw new Error('Ошибка на сервере');
      }
      
      const data = await response.json();
      console.log('Данные JSON ', data);
      
    } catch (error) {
      console.log('Что-то пошло не так:', error.message);
    }
  }
  getData();


 // 1. Create a reference to target the first input element
 const inputRef = useRef(null);

 useEffect(() => {
   // 2. Trigger focus as soon as the component loads into the DOM
   if (inputRef.current) {
    inputRef.current.focus();
   }
 }, [inputRef.current]); // Empty dependency array ensures this runs exactly once on mount


  const validateName = (name) => {return typeof name === 'string' && name.trim().length > 2;};
  const [name, setName] = useState('');
  const [nameValid, setNameValid] = useState(validateName(''));
  const onNameChange = (e) => {
    setName(e.target.value);
    setNameValid(validateName(e.target.value));
    setFormData({ ...formData, name: e.target.value });
 }

  const validatePhone = (phone) => {return typeof phone === 'string' && phone.trim().length > 2;};
  const [phone, setPhone] = useState('');
  const [phoneValid, setPhoneValid] = useState(validatePhone(''));
  const onPhoneChange = (e) => {
    setPhone(e.target.value);
    setPhoneValid(validatePhone(e.target.value));
    setFormData({ ...formData, phone: e.target.value });
 }

  const validateEmail = (email) => {return typeof email === 'string' && email.trim().length > 2;};
  const [email, setEmail] = useState('');
  const [emailValid, setEmailValid] = useState(validateEmail(''));
  const onEmailChange = (e) => {
    setEmail(e.target.value);
    setEmailValid(validateEmail(e.target.value));
    setFormData({ ...formData, email: e.target.value });
 }

  const validateMessage = (message) => {return typeof message === 'string' && message.trim().length > 2;};
  const [message, setMessage] = useState('');
  const [messageValid, setMessageValid] = useState(validateMessage(''));
  const onMessageChange = (e) => {
    setMessage(e.target.value);
    setMessageValid(validateMessage(e.target.value));
    setFormData({ ...formData, message: e.target.value });
 }

  const validateAge = (age) =>  age>=5;
  const [age, setAge] = useState('');
  const [ageValid, setAgeValid] = useState(validateAge(''));
  const onAgeChange = (e) => {
    setAge(e.target.value);
    setAgeValid(validateAge(e.target.value));
    setFormData({ ...formData, age: e.target.value });
 }

  const validateCheck = (check) =>  check === false;
  const [check, setCheck] = useState('');
  const [checkValid, setCheckValid] = useState(validateCheck(false));
  const onCheckChange = (e) => {
    setCheck(e.target.checked);
    setCheckValid(validateCheck(e.target.checked));
    setFormData({ ...formData, check: e.target.checked });
 }

  NProgress.configure({ 
    parent: '#my-container',
    showSpinner: false, 
    speed: 1050,
    trickleSpeed: 10
  });

  let text = document.querySelector("title").innerText;

  const handleSubmit = (e) => {
	  e.preventDefault();
  
    if(nameValid && phoneValid && emailValid && messageValid && !checkValid){
      console.log(`Имя: ${name} Телефон: ${phone} Почта: ${email} Сообщение: ${message} Права ${check}`);
  }
  else console.log("Данные не корректны")
   
    setIsFormVisible(false);
    setIsLoading(true);
    NProgress.start();
    setTimeout(() => {
      setIsLoading(false);
      NProgress.done();
    }, 1500);
	  console.log('Данные', formData);
	  };

    function infoblockreturn() {
      return new Promise((resolve, reject) => {
        setTimeout(() => {
          resolve('done!');
        },6500);
      });
   }
   
   infoblockreturn().then((done) => {
    const elements = document.getElementsByClassName('myDiv');
    const element = document.getElementById('myDiv');
    if (element) {
      element.textContent = "Success!";
     }
     console.log(done);
   });

   
  if (!setIsPanelOpen) return null;

  return (
    <div style={{ padding: '20px', fontFamily: 'sans-serif' }}>
  
      <button 
        onClick={() => setIsPanelOpen(true)}
        style={{ padding: '10px 20px', fontSize: '16px', cursor: 'pointer' }}
      >
        Запрос
      </button>

      {isPanelOpen && (
        <div 
          onClick={() => setIsPanelOpen(false)}
          style={{
            position: 'fixed', top: 0, left: 0, right: 0, bottom: 0,
            backgroundColor: 'rgba(0, 0, 0, 0.5)', zIndex: 100
          }}
        />
      )}

      <div id ="my-container"
        style={{
          position: 'fixed',
          left: 0,
          right: 0,
          bottom: isPanelOpen ? '0' : '-100%', 
          backgroundColor: '#efba46',
          padding: '30px 20px',
		      borderTopLeftRadius: '0px',
          borderTopRightRadius: '0px',
          boxShadow: '0 -2px 10px rgba(0,0,0,0.1)',
          transition: 'bottom 0.3s ease-in-out', 
          scrollBehavior: "smooth",
          zIndex: 101
        }}
      >
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        
          <h3>{text}</h3>
          
          <button
            onClick={() => setIsPanelOpen(false)}
            style={{ color: '#600', border: 'none', background: 'transparent', fontSize: '20px', cursor: 'pointer' }}
          >
            &times;
          </button>
        </div>	
		
		<div style={{height: '45vh', overflowY: 'auto', scrollbarColor: '#369 #ecfdf5', scrollbarWidth: 'thin'}}>
		
        {isFormVisible ? (

       <div>

      <form onSubmit={handleSubmit}>
            
                <label>Имя:</label><br />
                   <input type="text" autoFocus
                    //ref={inputRef}
                    value={name} 
                    onChange={onNameChange}
                    style={{backgroundColor:nameValid?'white':'white', border: nameValid?"thin solid green":"thin solid red"}} />
                   <br /><br />

                   <label>Телефон:</label><br />
                   <input type="tel" 
                    value={phone} 
                    onChange={onPhoneChange}
                    style={{backgroundColor:phoneValid?'white':'white', border: phoneValid?"thin solid green":"thin solid red"}} />
                   <br /><br />

                   <label>Элетропочта:</label><br />
                   <input type="text"
                    value={email} 
                    onChange={onEmailChange}
                    style={{backgroundColor:emailValid?'white':'white', border: emailValid?"thin solid green":"thin solid red"}} />
                   <br /><br />

                   <label>Сообщение:</label><br />
                   <textarea
                    value={message} 
                    onChange={onMessageChange}
                    style={{backgroundColor:messageValid?'white':'white', border: messageValid?"thin solid green":"thin solid red"}} />
                   <br /><br />
                
                  {/* <label>Лет:</label><br />
                  <input type="number" 
                      value={age} 
                      onChange={onAgeChange}  
                      style={{backgroundColor:ageValid?'white':'white', border: ageValid?"medium solid green":"medium solid red"}} />
                  <br /><br /> */}
                  
                <label>Права:</label><br />
                <input type="checkbox" className="custom-box"
                    value={check} 
                    onChange={onCheckChange} 
                     />
             <button disabled={!nameValid || !phoneValid || !emailValid || !messageValid || checkValid} type="submit">
             Отправить
            </button>
        </form>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
           <p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>

		   </div>
        ) : (

          <div className="success-message">
            <h1 id="myDiv"></h1>
          </div>
        )}
		
		</div>
		
      </div>
    </div>
  );
}

// Render the component into the DOM container
        const container = document.getElementById('root');
        const root = ReactDOM.createRoot(container);
        root.render(<BottomPanelApp />);