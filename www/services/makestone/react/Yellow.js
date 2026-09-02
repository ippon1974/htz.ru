function BottomPanelApp() {
  const { useState } = React;
  const { useEffect } = React;
  const { useRef } = React;
  const [isPanelOpen, setIsPanelOpen] = useState(false);
  const [formData, setFormData] = useState({ 
    page_title:'', 
    page_uri:'', 
    user_check_private_agree:'',
    dt:'',
    name: '', 
    phone: '', 
    email: '', 
    message:'', 
    check: false
  });
  const [isFormVisible, setIsFormVisible] = useState(true);
  const [isLoading, setIsLoading] = useState(false);
  const { YMapComponentsProvider , YMap, YMapDefaultSchemeLayer, YMapDefaultFeaturesLayer, YMapMarker } = ymaps3;

  // useEffect(() => {
  //   // Fetch your custom dark theme JSON file from the public folder or an API
  //   fetch('data/map.json')
  //     .then((res) => res.json())
  //     .then((data) => setCustomization(data))
  //     .catch((err) => console.error('Failed to load map customization JSON', err));
  // }, []);

  const mapRef = useRef(null);
  
  useEffect(() => {
    // Ensure ymaps3 is ready
    ymaps3.ready.then(() => {

      if (!mapRef.current) return;

      // Create the map instance
      const map = new YMap(mapRef.current,{
        location: { center: [37.425699, 55.709026], zoom: 17 }
      });

      const layer = new YMapDefaultSchemeLayer({
      //theme: 'light'
      //theme: 'dark',
      customization:[
        {
          "tags": {
            "any": [
              "water"
            ]
          },
          "elements": "geometry",
          "stylers": [
            {
              "color": "#2680ec"
            }
          ]
        },
        {
          "tags": {
            "any": [
              "landscape",
              "admin",
              "land",
              "transit"
            ]
          },
          "elements": "geometry",
          "stylers": [
            {
              "color": "#efba46"
            }
          ]
        },
        {
          "tags": {
            "any": [
              "road"
            ]
          },
          "elements": "geometry",
          "stylers": [
            {
              "color": "#4E4E4E"
            }
          ]
        },
        {
          "tags": {
            "any": [
              "building"
            ]
          },
          "elements": "geometry",
          "stylers": [
            {
              "color": "#757474"
            }
          ]
        }
      ]

      });
      map.addChild(layer);

      map.addChild(new YMapDefaultFeaturesLayer());
     
      const markerElement = document.createElement('div');
      markerElement.className = 'custom-marker';
      markerElement.innerHTML = '<div>Сивек Ватер Джет</div>';

      const marker = new YMapMarker({
        coordinates: [37.425699, 55.709026],
        draggable: false
      }, markerElement);
    
      map.addChild(marker);
  
    });
  }, []);

  if (!YMap) return <div>Loading map...</div>;

  // async function getData() {
  //   try {
  //     const response = await fetch('https://htz.ru/api/post/order/makestone/');
      
  //     // Проверяем, прошел ли запрос успешно
  //     if (!response.ok) {
  //       throw new Error('Ошибка на сервере');
  //     }
      
  //     const data = await response.json();
  //     console.log('Данные JSON ', data);
      
  //   } catch (error) {
  //     console.log('Что-то пошло не так:', error.message);
  //   }
  // }
  // getData();

 // 1. Create a reference to target the first input element
 const inputRef = useRef(null);

 useEffect(() => {
   // 2. Trigger focus as soon as the component loads into the DOM
   if (inputRef.current) {
    inputRef.current.focus();
   }
 }, [inputRef.current]); // Empty dependency array ensures this runs exactly once on mount


  const hiddenFieldsClick = (e) => {
    const form = e.currentTarget.form;
    const fd = new FormData(form);
    const page_title = fd.get('page_title');
    const page_uri = fd.get('page_uri');
    const user_check_private_agree = fd.get('user_check_private_agree');
    const dt = fd.get('dt');
    setFormData({  ...formData, page_title: page_title, page_uri: page_uri, user_check_private_agree: user_check_private_agree,dt:dt})
  }

  const validateName = (name) => {return typeof name === 'string' && name.trim().length > 1;};
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

  let textTitle = document.querySelector("title").innerText;

  const handleSubmit = (e) => {
	  e.preventDefault();

    if(nameValid && phoneValid && emailValid && messageValid && !checkValid){
      //console.log(`Имя: ${name} Телефон: ${phone} Почта: ${email} Сообщение: ${message} Права ${check}`);
  }
  else console.log("Данные не корректны")

    setIsFormVisible(false);
    setIsLoading(true);
    NProgress.start();
    setTimeout(() => {
      setIsLoading(false);
      NProgress.done();
    }, 1500);
	  //console.log('Данные из формы ...', formData);
    const jsonTotal = JSON.stringify(formData);
    console.log('Данные из формы JSON ...', jsonTotal);
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

   const currentUrl = window.location.href;
   const d = new Date();
   const year = d.getFullYear();
   const month = String(d.getMonth() + 1).padStart(2, '0');
   const day = String(d.getDate()).padStart(2, '0');
   const hours = String(d.getHours()).padStart(2, '0');
   const minutes = String(d.getMinutes()).padStart(2, '0');
   const seconds = String(d.getSeconds()).padStart(2, '0');
   const formatted = `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
   //console.log(formatted); 
   
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
          padding: '20px 20px',
		      borderTopLeftRadius: '0px',
          borderTopRightRadius: '0px',
          boxShadow: '0 -2px 10px rgba(0,0,0,0.1)',
          transition: 'bottom 0.3s ease-in-out', 
          scrollBehavior: "smooth",
          zIndex: 101
        }}
      >
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        
        {/* <h1></h1>

        <button
            onClick={() => setIsPanelOpen(false)}
            style={{ color: '#600', border: 'none', background: 'transparent', fontSize: '20px', cursor: 'pointer' }}
          >
            &times;
          </button> */}
          
        </div>
		
      <div className="modalHeight">
		
      {isFormVisible ? (

      <div>
    
<div className="parent">
    <div className="modal_header"><h1>Предварительный запрос: {textTitle}.</h1>
    <h2>Мы постараемся ответить на ваш запрос в течении 5-6 часов в рабочее время.</h2>
    </div>
    <div className="modal_address">
      <p className="block_head">Российская Федерация, 121357, г.Москва, Можайский (ЗАО), ул.Верейская,д.29 С 82</p>
    </div>
    <div className="modal_form">
      
      <form onSubmit={handleSubmit}>
      <input type="hidden" name="page_title" value={textTitle} />
      <input type="hidden" name="page_uri" id="urlInput" value={currentUrl} />
      <input type="hidden" name="user_check_private_agree" value="Я даю согласие на обработку моих персональных данных в соответствии с Политикой обработки персональных данных" />
      <input type="hidden" name="dt" value={formatted} />
               <div>
               <label htmlFor ="name">Ваше имя:</label>
               <input className="firstname" type="text" autoFocus
                id="name"
                name="name"
                //ref={inputRef}
                value={name}
                onChange={onNameChange}
                style={{backgroundColor:nameValid?'white':'white', border: nameValid?"thin solid green":"thin solid red"}} />
               </div>

               <div>
               <label htmlFor ="phone">Телефон:</label>
               <input type="tel" 
                id="phone"
                name="phone"
                value={phone} 
                onChange={onPhoneChange}
                style={{backgroundColor:phoneValid?'white':'white', border: phoneValid?"thin solid green":"thin solid red"}} />
               </div>

               <div>
               <label htmlFor ="email">Элетропочта:</label>
               <input type="text"
               id="email"
               name="email"
                value={email} 
                onChange={onEmailChange}
                style={{backgroundColor:emailValid?'white':'white', border: emailValid?"thin solid green":"thin solid red"}} />
               </div>

               <div>
               <label htmlFor ="message">Сообщение:</label>
               <textarea
                id="message"
                name="message"
                value={message} 
                onChange={onMessageChange}
                style={{backgroundColor:messageValid?'white':'white', border: messageValid?"thin solid green":"thin solid red"}} />
               </div>
            
            <div className="checkbox-container">
            <input type="checkbox"
                id="check"
                name="check"
                value={check}
                onChange={onCheckChange} 
                 />

            <label htmlFor ="check" className="policy">
                Я даю согласие на обработку моих персональных данных в соответствии с <a href="/documents/policy/" target="_blank">Политикой обработки персональных данных</a>
            </label>
            </div>
            <div>
            <button className="button" onClick={hiddenFieldsClick}
            style={{
              backgroundColor:!nameValid || !phoneValid || !emailValid || !messageValid || checkValid?'#CCCC00':'green',
              cursor:!nameValid || !phoneValid || !emailValid || !messageValid || checkValid?'none':'pointer',
              color:!nameValid || !phoneValid || !emailValid || !messageValid || checkValid?'grey':'white'
            }}
            disabled={!nameValid || !phoneValid || !emailValid || !messageValid || checkValid} 
            type="submit">
              Отправить
            </button>
            </div>
    </form>

    </div>
    <div className="modal_contacts">
      <p className="block_head">Пн-Пт с 9:00 до 19:00. Выходные дни: суббота и воскресенье.
      Контактный телефон: +7 (925) 585-33-71 (MAX)
      Электронная почта: mail@htz.ru</p>
    </div>
    <div className="modal_map">

    <div ref={mapRef} style={{ width: '100%', height: '500px' }} />;

    </div>
    <div className="modal_copy">&copy; 2004&mdash;{year} «СПМ»</div>
</div>
		   </div>
        ) : (
          <div className="success-message">
            <h1 id="myDiv"></h1>
            <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
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