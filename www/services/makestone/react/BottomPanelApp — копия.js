import React, { useState } from 'react';

function BottomPanelApp() {
  // 1. Состояние для отслеживания видимости панели
  const [isPanelOpen, setIsPanelOpen] = useState(false);

  return (
    <div style={{ padding: '20px', fontFamily: 'sans-serif' }}>
      <h1>Пример нижней панели</h1>

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
          backgroundColor: '#ffffff',
          padding: '30px 20px',
          borderTopLeftRadius: '16px',
          borderTopRightRadius: '16px',
          boxShadow: '0 -2px 10px rgba(0,0,0,0.1)',
          transition: 'bottom 0.3s ease-in-out', // Плавная анимация
          zIndex: 101
        }}
      >
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
          <h3>Настройки</h3>
          {/* Кнопка закрытия внутри панели */}
          <button 
            onClick={() => setIsPanelOpen(false)}
            style={{ border: 'none', background: 'transparent', fontSize: '20px', cursor: 'pointer' }}
          >
            &times;
          </button>
        </div>
        <p>Здесь может располагаться любое содержимое: фильтры, меню, настройки.</p>
      </div>
    </div>
  );
}

export default BottomPanelApp;