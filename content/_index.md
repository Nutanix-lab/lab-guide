+++
title = "Nutanix实验室"
description = ""
date = "2017-04-24T18:36:24+02:00"

+++

# 简介
[Nutanix-lab/lab-guide {{%icon fa-github%}}](https://github.com/Nutanix-lab/lab-guide) 代码仓库是本站的文档源码，里面包含了一部分产品操作指南，旨在帮助相关人员快速了解和掌握产品的使用方式。, **这是一个免费开放的平台，我们欢迎任何人提交你的使用技巧和心得等文章。**

其它相关的站点包括，Nutanix官方的Github账号[Nutanix {{%icon fa-github%}}](https://github.com/Nutanix/)；[Nutanix全球用户支持门户 {{%icon fa-bookmark%}}](https://portal.nutanix.com//)

 {{%panel%}}
 * Nutanix中国官方微信公众号 ： Nutnaix-China
 * IT锐观察： CHINAEUC
 * [Nutanix圣经](http://nutanixbible.com/)
  {{%/panel%}}

## 主要内容 

* [Search]({{%relref "search/_index.md" %}})
* **Unlimited menu levels**
* [Generate RevealJS presentation]({{%relref "page-slide.md"%}}) from markdown (embededed or fullscreen page)
* Automatic next/prev buttons to navigate through menu entries
* [Image resizing, shadow...]({{%relref "create-page/page-images.md" %}})
* [Attachments files]({{%relref "shortcodes/attachments.md" %}})
* [List child pages]({{%relref "shortcodes/children/_index.md" %}})
* [Excerpt]({{%relref "shortcodes/excerpt.md"%}}) ! Include segment of content from one page in another
* [Mermaid diagram]({{%relref "shortcodes/mermaid.md" %}}) (flowchart, sequence, gantt)
* [Icons]({{%relref "shortcodes/icon.md" %}}), [Buttons]({{%relref "shortcodes/button.md" %}}), [Alerts]({{%relref "shortcodes/alert.md" %}}), [Panels]({{%relref "shortcodes/panel.md" %}}), [Tip/Note/Info/Warning boxes]({{%relref "shortcodes/notice.md" %}}), [Expand]({{%relref "shortcodes/expand.md" %}})
* [customizable look and feel]({{%relref "content-organisation/customize-style/_index.md"%}}), [theme style]({{%relref "content-organisation/customize-style/themestyle.md"%}}), [theme variants]({{%relref "content-organisation/customize-style/theme-variants.md"%}})



Style "Original"

![](https://raw.githubusercontent.com/vjeantet/hugo-theme-docdock/master/images/tn.png?width=33pc&classes=border,shadow)

Style "Flex"

![](style-flexfull.png?width=33pc&classes=border,shadow)

## Contribute to this documentation
Feel free to update this content, just click the **Edit this page** link displayed on top right of each page, and pullrequest it
{{%alert%}}Your modification will be deployed automatically when merged.{{%/alert%}}


## Documentation website
This current documentation has been statically generated with Hugo with a simple command : `hugo -t docdock` -- source code is [available here at GitHub {{%icon fa-github%}}](https://github.com/vjeantet/hugo-theme-docDock)

{{% panel theme="success" header="Automated deployments" footer="Netlify builds, deploys, and hosts  frontends." %}}
Automatically published and hosted thanks to [Netlify](https://www.netlify.com/).

Read more about [Automated HUGO deployments with Netlify](https://www.netlify.com/blog/2015/07/30/hosting-hugo-on-netlifyinsanely-fast-deploys/)
{{% /panel %}}
