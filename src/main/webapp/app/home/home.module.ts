import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';

import { Ta3AlamaSharedModule } from 'app/shared/shared.module';
import { HOME_ROUTE } from './home.route';
import { HomeComponent } from './home.component';

@NgModule({
  imports: [Ta3AlamaSharedModule, RouterModule.forChild([HOME_ROUTE])],
  declarations: [HomeComponent]
})
export class Ta3AlamaHomeModule {}
