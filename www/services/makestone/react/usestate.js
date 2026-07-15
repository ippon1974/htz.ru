function ActionButton() {
  const { useState } = React;
  // Функция, которая сработает при нажатии
  const handleClick = () => {
    alert('Кнопка нажата!');
  };

  return (
    // Вешаем событие onClick5
    <button onClick={handleClick}>
      Нажми меня
    </button>
  );
}

		const container = document.getElementById('root');
        const root = ReactDOM.createRoot(container);
        root.render(<ActionButton />);