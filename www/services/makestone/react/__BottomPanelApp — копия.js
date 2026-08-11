function BottomPanelApp(props) {
  const { useState } = React;
  const{ useLayoutEffect } = React;
  const{ useRef } = React;
  const [isPanelOpen, setIsPanelOpen] = useState(false);
  const [formData, setFormData] = useState({ name: '', phone: '', email: '', message:'', check: false });
  const [isFormVisible, setIsFormVisible] = useState(true);
  const [isLoading, setIsLoading] = useState(false);

  

  NProgress.configure({ 
    parent: '#my-container',
    showSpinner: false, 
    speed: 1050,
    trickleSpeed: 10
  });

  let text = document.querySelector("title").innerText;

  const handleSubmit = (e) => {
	  e.preventDefault();

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
		
		<div style={{height: '45vh'}}>
		
        {isFormVisible ? (

       <div>

		   <form onSubmit={handleSubmit} disabled={isLoading}>
       
       <div className="parent-form">

       <div className="form-group">
        <input 
        type="text"
        onChange={(e) => setFormData({ ...formData, name: e.target.value})}
        placeholder="ФИО"
        value={formData.name}
        //style={{borderColor: nameValid?"green":"red"}}
				/>
       </div>

       <div className="form-group">
        <input type="text" 
				onChange={(e) => setFormData({ ...formData, phone: e.target.value })} 
				placeholder="Телефон" value={formData.phone} 
				/>
        </div>

        <div className="form-group">
        <input type="text" 
				onChange={(e) => setFormData({ ...formData, email: e.target.value })} 
				placeholder="Электропочта" value={formData.email} 
				/>
        </div>

        <div className="form-group">
        <textarea
				onChange={(e) => setFormData({ ...formData, message: e.target.value})} 
				placeholder="Сообщение" value={formData.message} 
				/>
       </div>
      
       <div className="form-group">
        <input type="checkbox"
				onChange={(e) => setFormData({ ...formData, check: e.target.checked })} 
				value={formData.check} 
				/>
        </div>

        <div className="form-group">
        <button type="submit">
        {isLoading ? 'Loading...' : 'Отправить'}
        </button>
        </div>
        </div>
        </form>
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