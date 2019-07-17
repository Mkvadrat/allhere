<div class="callback__block">
    <div class="callback__form">
        <div>
            <div class="title__form">Заказать обратный звонок</div>
            <div class="fields__box form-inline form-row">
                <div class="form-group col-12 col-md-4">
                    <span><input type="text" id="name" class="reset_input" placeholder="Имя"></span>
                </div>
                <div class="form-group col-12 col-md-4">
                    <span><input type="text" id="phone" class="reset_input" placeholder="Телефон"></span>
                </div>
                <div class="form-group col-12 col-md-8">
                    <span><input type="text" id="message" class="reset_input" placeholder="Вопрос"></span>
                </div>
                <div class="form-group col-12 col-md-4">
                    <span><input type="submit" id="submit" disabled="disabled" onclick="sendForm();" value="Отправить"></span>
                </div>
                <div class="warning"></div>
                <div class="form-group col-12">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" onchange="document.getElementById('submit').disabled = !this.checked;" id="gridCheck">
                        <label class="form-check-label" for="gridCheck">
                            Я даю согласие на обработку моих персональных данных
                        </label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
