import { Controller} from 'stimulus';

export default class extends Controller {
  static targets = ['preview']

  connect(){
    this.displayHTML();
  }


  displayHTML() {
    this.previewTarget.contentDocument.documentElement.innerHTML = this.updateHtml();
  }

  get rawHtml(){
    return this.data.get('rawHtml');
  }

  updateHtml() {
    let html = this.rawHtml;
    const variables = html.match(/(?<={{{)\w+(?=}}})/g); // matches all variable in raw HTML
    variables.forEach((variable) => {
      const input = this.inputTargets.find(input => input.name === variable); // find input with variable name
      if (input) {
        html = html.replace(`{{{${variable}}}}`, input.value);
      }
    });
    return html;
  }
}
