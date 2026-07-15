function BottomPanelApp() {
	
  const { useState } = React;
  const { useRef } = React;
  
  // 1. Состояние для отслеживания видимости панели
  const [isPanelOpen, setIsPanelOpen] = useState(false);
  const [formData, setFormData] = useState({ name: '' });
  
  // Состояние видимости самой формы
  const [isFormVisible, setIsFormVisible] = useState(true);
  
  const myhRef = useRef(null);
  
  let text = document.querySelector("title").innerText;
  
  const handleSubmit = (e) => {
	  e.preventDefault();
	  setIsFormVisible(false); // Скрываем форму после отправки
	  console.log('Отправка данных:', formData);
	  };
	  
  if (!setIsPanelOpen) return null;
  

  return (
    <div style={{ padding: '20px', fontFamily: 'sans-serif' }}>
    
      {/* 2. Кнопка для вызова панели */}
      <button 
        onClick={() => setIsPanelOpen(true)}
        style={{ padding: '10px 20px', fontSize: '16px', cursor: 'pointer' }}
      >
        Открыть панель
      </button>

      {/* 3. Оверлей (затемнение фона), клик по которому закрывает панель */}
      {isPanelOpen && (
        <div 
          onClick={() => setIsPanelOpen(false)}
          style={{
            position: 'fixed', top: 0, left: 0, right: 0, bottom: 0,
            backgroundColor: 'rgba(0, 0, 0, 0.5)', zIndex: 100
          }}
        />
      )}

      {/* 4. Сама панель, выезжающая снизу */}
      <div 
        style={{
          position: 'fixed',
          left: 0,
          right: 0,
          bottom: isPanelOpen ? '0' : '-100%', // Появление или скрытие за экраном
          backgroundColor: '#efba46',
          padding: '30px 20px',
		  borderTopLeftRadius: '0px',
          borderTopRightRadius: '0px',
          boxShadow: '0 -2px 10px rgba(0,0,0,0.1)',
          transition: 'bottom 0.3s ease-in-out', // Плавная анимация
          zIndex: 101
        }}
      >
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
          <h3>{text}</h3>
          {/* Кнопка закрытия внутри панели */}
          <button 
            onClick={() => setIsPanelOpen(false)}
            style={{ color: 'blue', border: 'none', background: 'transparent', fontSize: '20px', cursor: 'pointer' }}
          >
            &times;
          </button>
        </div>	
		
		<div style={{height: '45vh'}}>
		
        <p>Здесь может располагаться любое содержимое: фильтры, меню, настройки.</p>
		
		
		{/* Условный рендеринг: показываем форму или текст */}
        {isFormVisible ? (
          <div>
		  <form onSubmit={handleSubmit}>
          <input type="text" 
				onChange={(e) => setFormData({ ...formData, name: e.target.value })} 
				placeholder="Ваше имя" value={formData.name} 
				/>
		  
          <button type="submit">Отправить</button>
        </form>
		  </div>
        ) : (
          <div className="success-message">
            <h2>Спасибо!</h2>
            <p>Ваша форма успешно отправлена.</p>
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