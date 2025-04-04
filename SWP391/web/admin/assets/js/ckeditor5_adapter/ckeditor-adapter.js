class MyUploadAdapter {
    constructor(loader) {
        this.loader = loader;
    }

    upload() {
        return this.loader.file
            .then(file => new Promise((resolve, reject) => {
                const formData = new FormData();
                formData.append('upload', file);

                fetch('http://localhost:8080/SWP391/admin/save_image', { // URL servlet upload
                    method: 'POST',
                    body: formData
                })
                .then(response => response.json())
                .then(result => {
                    if (!result || !result.url) {
                        return reject('Upload thất bại!');
                    }
                    resolve({
                        default: result.url // Ảnh trả về từ server
                    });
                })
                .catch(error => {
                    reject(error);
                });
            }));
    }
}

function MyCustomUploadAdapterPlugin(editor) {
    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
        return new MyUploadAdapter(loader);
    };
}


