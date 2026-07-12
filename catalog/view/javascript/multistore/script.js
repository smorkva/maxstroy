class Multistore {

  constructor(settings){
    this.url = settings.url;
    this.hash = settings.hash;

    // Отображаем данные без опций
    this.handlerOption();

    // Отслеживаем переключение опций
    document.querySelectorAll('input[name^=option][type=checkbox], input[name^=option][type=radio], select[name^=option]').forEach((input) => {
      input.addEventListener("change", this.handlerOption.bind(this));
    });

    // Отслеживание для модуля ввода с количеством
    document.querySelectorAll('.owq-input').forEach(input => {
      input.addEventListener("input", this.handlerOption.bind(this));
    });

    document.querySelectorAll('.owq-sub').forEach(button => {
      button.addEventListener("click", this.handlerOption.bind(this));
    });

    document.querySelectorAll('.owq-add').forEach(button => {
      button.addEventListener("click", this.handlerOption.bind(this));
    });
  }

  get loader(){
    return '<div class="loader">Loading...</div>';
  }

  get element(){
    return document.querySelector(`#multistores-${this.hash}`);
  }

  handlerOption(){

    let options = [];

    document.querySelectorAll('input[name^=option][type=checkbox]:checked, input[name^=option][type=radio]:checked, select[name^=option]').forEach(({value}) => {
      if (value.length > 0) options.push(value);
    });

    this.getMultistore(options);
  }

  async getMultistore(options_id = []){

    this.loading();

    const options = {
      method: 'GET',
      cache: 'no-cache',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      }
    }

    let request_url = this.url;
    if (options_id && options_id.length > 0) {
      request_url += '&options_id=' + options_id.join()
    }

    return await fetch(request_url, options)
      .then(response => response.text())
      .then(html => this.render(html))
      .then(() => this.loaded())
      .catch(error => console.log(error));

  }

  loading(){
    this.element.classList.add('multistores-loading');
  }

  loaded(){
    this.element.classList.remove('multistores-loading');
  }

  render(html){
    this.element.innerHTML = html;
  }

}