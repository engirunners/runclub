import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['element'];

  elementTargetConnected(element) {
    new bootstrap.Tooltip(element);
  }
}
