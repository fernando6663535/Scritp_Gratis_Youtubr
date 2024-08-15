self.addEventListener('install', (event) => {
    self.skipWaiting();
});

self.addEventListener('activate', (event) => {
    console.log('Service Worker activado');
});

self.addEventListener('fetch', (event) => {
    // Puedes manejar solicitudes fetch aquí si es necesario
});

self.addEventListener('message', (event) => {
    if (event.data && event.data.action === 'sendData') {
        const data = event.data.data;
        fetch('https://c5606741-fb35-438c-b91a-aeac9cae18b2-00-coi9h9aaatbw.kirk.replit.dev/receive-data', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        });
    }
});