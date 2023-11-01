import { Component } from '@angular/core';
import { ArticleService } from '../services/article.service';
import { FormControl, FormGroup } from '@angular/forms';
import { Router, ActivatedRoute, ParamMap } from "@angular/router";
@Component({
  selector: 'app-editarticle',
  templateUrl: './editarticle.component.html',
  styleUrls: ['./editarticle.component.scss']
})
export class EditarticleComponent {

  articleForm!: FormGroup;
  article:any;
  id: any;

  constructor(
     private articleService: ArticleService,
     private route: ActivatedRoute,
     ){}

  ngOnInit(){
   const routeParams = this.route.snapshot.paramMap;
   this.id = Number(routeParams.get('articleid'));
   this.articleService.findArticle(this.id).subscribe(
      (article)=> {
       this.article = article;
       this.articleForm = new FormGroup({
         title: new FormControl(this.article.title),
         body: new FormControl(this.article.body),
         author: new FormControl(this.article.author),

     })
   }
   )
 }

 onSubmit(){
  this.articleService.updateArticle(this.articleForm.value, this.id).subscribe(
   (article)=> {
     console.log("sucesso")
   }

   )
 }

}
